-- TODO: split into plugins folder, plugins.lsp, lazy.lua
-- TODO: change appropriate plugin keybinds to lazy.nvim keys tables
return {
-- General plugins
--  { "xiyaowong/transparent.nvim" },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            {
                "L3MON4D3/LuaSnip",
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
            },
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
            "onsails/lspkind.nvim" -- vs-code like pictograms
        },
        config = function()
            local cmp = require("cmp")
            -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                window = {
                    -- completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },
                completion = {
                    completeopt = "menu,menuone,preview,noselect"
                },
                snippet = { -- configure how nvim-cmp interacts with snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                    ["<CR>"] = cmp.mapping.confirm({ select = false })
                }),
                -- sources for autocompletion
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- snippets
                    { name = "buffer" }, -- text within current buffer
                    { name = "path" } -- file system paths
                }),
                -- configure lspkind for vs-code like pictograms in completion menu
                formatting = {
                    format = require("lspkind").cmp_format({
                        maxwidth = 50,
                        ellipsis_char = "..."
                    }),
                }
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = { "InsertEnter" },
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true
            })
            require("nvim-autopairs.completion.cmp")
            require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    render = "wrapped-compact"
                }
            },
            "nvim-treesitter/nvim-treesitter"
        },
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-tree/nvim-web-devicons",
            "nvim-treesitter/nvim-treesitter",
            "folke/todo-comments.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                        }
                    }
                }
            })
            telescope.load_extension("fzf")
            telescope.load_extension("frecency")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local lazy_status = require("lazy.status")
            require("lualine").setup {
                options = {
                    theme = require("lualine.themes.nord"),
                    globalstatus = true
                },
                extensions = { "nvim-tree" },
                sections = {
                    lualine_b = {
                        { "filetype" }
                    },
                    lualine_c = {
                        { "fileformat" }
                    },
                    lualine_x = {
                        { "encoding" },
                        { "diff" }
                    },
                    lualine_y = {
                        { "diff" },
                        { "branch" },
                        { "progress" }
                    },
                    lualine_z = {
                        { "location" }
                    }
                }
            }
        end
    },
    {
        "booperlv/nvim-gomove",
        config = function()
            require("gomove").setup({
                -- whether or not to vim.keymap.set default key bindings, (true/false)
                map_defaults = false,
                -- whether or not to reindent lines moved vertically (true/false)
                reindent = true,
                -- whether or not to undojoin same direction moves (true/false)
                undojoin = true,
                -- whether to not to move past end column when moving blocks horizontally, (true/false)
                move_past_end_col = false,
            })
            local map = vim.keymap.set
            map( 'n', '<S-h>', '<Plug>GoNMLineLeft', {} )
            map( 'n', '<S-j>', '<Plug>GoNMLineDown', {} )
            map( 'n', '<S-j>', '<Plug>GoNMLineDown', {} )
            map( 'n', '<S-j>', '<Plug>GoNMLineDown', {} )
            map( 'n', '<S-k>', '<Plug>GoNMLineUp', {} )
            map( 'n', '<S-l>', '<Plug>GoNMLineRight', {} )
            map( 'n', '<C-h>', '<Plug>GoNDLineLeft', {} )
            map( 'n', '<C-j>', '<Plug>GoNDLineDown', {} )
            map( 'n', '<C-k>', '<Plug>GoNDLineUp', {} )
            map( 'n', '<C-l>', '<Plug>GoNDBlockRight', {} )
            map( 'x', '<S-h>', '<Plug>GoVMLineLeft', {} )
            map( 'x', '<S-j>', '<Plug>GoVMLineDown', {} )
            map( 'x', '<S-k>', '<Plug>GoVMLineUp', {} )
            map( 'x', '<S-l>', '<Plug>GoVMLineRight', {} )
            map( 'x', '<C-h>', '<Plug>GoVDLineLeft', {} )
            map( 'x', '<C-j>', '<Plug>GoVDLineDown', {} )
            map( 'x', '<C-k>', '<Plug>GoVDLineUp', {} )
            map( 'x', '<C-l>', '<Plug>GoVDLineRight', {} )
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            -- recommended settings from nvim-tree documentation
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require("nvim-tree").setup({
                view = {
                    width = 35,
                    relativenumber = true,
                },
                -- change folder arrow icons
                renderer = {
                    indent_markers = {
                        enable = true,
                    },
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "›", -- arrow when folder is closed
                                arrow_open = "⌄", -- arrow when folder is open
                            },
                        },
                    },
                },
                git = {
                    ignore = false,
                },
            })
          end 
    },
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function()
            local dashboard = require("alpha.themes.dashboard")
            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }
            dashboard.section.buttons.val = {
                dashboard.button("e", " ➲ New File", "<cmd>ene<CR>"),
                dashboard.button("SPACE ee", " ➲ Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
                dashboard.button("SPACE ff", "󰱼 ➲ Find File", "<cmd>Telescope find_files<CR>"),
                dashboard.button("SPACE fs", " ➲ Find Word", "<cmd>Telescope live_grep<CR>"),
                dashboard.button("SPACE wr", "󰁯 ➲ Restore Session For Current Directory ", "<cmd>SessionRestore<CR>"),
                dashboard.button("q", " ➲ Quit NVIM", "<cmd>qa<CR>"),
            }
            require("alpha").setup(dashboard.opts)
            vim.cmd("autocmd FileType alpha setlocal nofoldenable")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "windwp/nvim-ts-autotag",
                config = true
            }
        },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                autotag = {
                    enable = true
                },
                ensure_installed = {
                    'c',
                    'c_sharp',
                    'cmake',
                    'cpp',
                    'css',
                    'csv',
                    'git_config',
                    'git_rebase',
                    'gitattributes',
                    'gitcommit',
                    'gitignore',
                    'html',
                    'java',
                    'javascript',
                    'json',
                    'kdl',
                    'kconfig',
                    'lua',
                    'make',
                    'kotlin',
                    'ruby',
                    'nix',
                    'dockerfile',
                    'powershell',
                    'python',
                    'r',
                    'rust',
                    'scss',
                    'sql',
                    'ssh_config',
                    'toml',
                    'typescript',
                    'vim',
                    'yaml',
                    'svelte',
                    'bash',
                    'asm'
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<C-space>',
                        node_incremental = '<C-space>',
                        scope_incremental = false,
                        node_decremental = '<bs>'
                    }
                }
            })
        end
    },
--[[{
        "https://git.sr.ht/~swaits/zellij-nav.nvim",
        lazy = true,
        event = "VeryLazy",
        keys = {
            { '<c-h>', "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left"  } },
            { '<c-j>', "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
            { '<c-k>', "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
            { '<c-l>', "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
        },
        opts = {},
    }]]--
-- LSP
    {
        "williamboman/mason.nvim",
        dependencies = { "mason-lspconfig.nvim" },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_pending = "⚠",
                        package_installed = "✓",
                        package_uninstalled = "✗"
                    }
                }
            })
            require("mason-lspconfig").setup({
                ensure_installed ={
                    "asm_lsp",
                    "bashls",
                    "clangd",
                    "cmake",
                    "cssls",
                    "dockerls",
                    "html",
                    "htmx",
                    "jdtls",
                    "tsserver",
                    "kotlin_language_server",
                    "autotools_ls",
                    "pyright",
                    "sqlls",
                    "svelte",
                    "taplo",
                    "lemminx",
                    "yamlls",
                    "emmet_ls",
                    "lua_ls"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                -- TODO: debug nvim-lsp-file-operations (debug log shows two setting up NvimTree integration steps. could be faulty integration from NvimTree?)
                "antosha417/nvim-lsp-file-operations",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-tree/nvim-tree.lua"
                },
                config = function()
                    require("lsp-file-operations").setup({
                        debug = true
                    })
                end
            },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        {
                            path = "luvit-meta/library",
                            words = { "vim%.uv" }
                        }
                    }
                }
            },
            {
                "Bilal2453/luvit-meta",
                lazy = true
            }
        },
        config = function()
            -- import lspconfig plugin
            local lspconfig = require("lspconfig")
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf, silent = true }
                    local map = vim.keymap.set
                    -- set keybinds
                    opts.desc = "Show LSP references"
                    map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                    opts.desc = "Go to declaration"
                    map("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                    opts.desc = "Show LSP definitions"
                    map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                    opts.desc = "Show LSP implementations"
                    map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                    opts.desc = "Show LSP type definitions"
                    map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                    opts.desc = "See available code actions"
                    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                    opts.desc = "Smart rename"
                    map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                    opts.desc = "Show buffer diagnostics"
                    map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                    opts.desc = "Show line diagnostics"
                    map("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                    opts.desc = "Go to previous diagnostic"
                    map("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                    opts.desc = "Go to next diagnostic"
                    map("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                    opts.desc = "Show documentation for what is under cursor"
                    map("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                    opts.desc = "Restart LSP"
                    map("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
              end,
            })

            -- used to enable autocompletion (assign to every lsp server config)
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Change the Diagnostic symbols in the sign column (gutter)
            -- (not in youtube nvim video)
            local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            require("mason-lspconfig").setup_handlers({
                -- default handler for installed servers
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                    })
                end,
                ["svelte"] = function()
                    -- configure svelte server
                    lspconfig["svelte"].setup({
                        capabilities = capabilities,
                        on_attach = function(client, bufnr)
                            vim.api.nvim_create_autocmd("BufWritePost", {
                                pattern = { "*.js", "*.ts" },
                                callback = function(ctx)
                                    -- Here use ctx.match instead of ctx.file
                                    client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                                end,
                            })
                        end,
                    })
                end,
                ["lua_ls"] = function()
                    -- configure lua server (with special settings)
                    lspconfig["lua_ls"].setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    -- make the language server recognize "vim" global
                                    globals = { "vim" },
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        },
                    })
                end,
                ["emmet_ls"] = function()
                    -- configure emmet language server
                    lspconfig["emmet_ls"].setup({
                        capabilities = capabilities,
                        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
                    })
                end
            })
        end
    }
}
