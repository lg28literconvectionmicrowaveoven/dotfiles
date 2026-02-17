#!/bin/bash
# Script: hyprlock-music.sh
# Purpose: Display currently playing music from various sources

# First try playerctl (works with most players)
if command -v playerctl &> /dev/null; then
    status=$(playerctl status 2>/dev/null)
    
    if [[ "$status" == "Playing" ]]; then
        artist=$(playerctl metadata artist 2>/dev/null)
        title=$(playerctl metadata title 2>/dev/null)
        
        if [[ -n "$artist" && -n "$title" ]]; then
            echo "♪ $artist - $title"
            exit 0
        fi
    elif [[ "$status" == "Paused" ]]; then
        echo "♪ Music paused"
        exit 0
    fi
fi

# Try specific players if playerctl didn't work

# Spotify
if pgrep -x "spotify" >/dev/null; then
    metadata=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2>/dev/null)
    
    if [[ -n "$metadata" ]]; then
        artist=$(echo "$metadata" | grep -A 2 "artist" | tail -n 1 | cut -d '"' -f 2)
        title=$(echo "$metadata" | grep -A 1 "title" | tail -n 1 | cut -d '"' -f 2)
        
        if [[ -n "$artist" && -n "$title" ]]; then
            echo "♫ $artist - $title"
            exit 0
        fi
    fi
fi

# MPD
if command -v mpc &> /dev/null; then
    current_song=$(mpc current 2>/dev/null)
    
    if [[ -n "$current_song" ]]; then
        echo "♫ $current_song"
        exit 0
    fi
fi

# No music detected
echo "No music playing"
