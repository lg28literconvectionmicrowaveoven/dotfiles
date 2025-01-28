#!/bin/sh
current_gpu_state=`supergfxctl -g`
current_hybrid_state=`cat ~/.hybrid_status`
percent=0

if [ $current_gpu_state == "Hybrid" ]; then
    percent=$(( $percent + 50 ))
fi

if [ $current_hybrid_state == "False" ]; then
    percent=$(( $percent + 50 ))
fi

if [ $percent -eq 0 ]; then
    echo "{\"tooltip\":\"Supergfxctl status: Integrated. Display Mode: Hybrid.\",\"percentage\":`echo $percent`,\"class\":\"integrated-hybrid\"}"
elif [ $percent -eq 50 ]; then
    echo "{\"tooltip\":\"Supergfxctl status: Hybrid. Display mode: Hybrid.\",\"percentage\":`echo $percent`,\"class\":\"hybrid-hybrid\"}"
elif [ $percent -eq 100 ]; then
    echo "{\"tooltip\":\"Supergfxctl status: Hybrid. Display mode: dGPU.\",\"percentage\":`echo $percent`,\"class\": \"hybrid-dgpu\"}"
fi
