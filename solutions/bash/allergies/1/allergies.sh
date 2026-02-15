#!/bin/bash

alergies=()
element=$1


if [[ $element -gt 1023 && $element -lt 2048 ]]; then
    element=$(( element - 1024 ))
fi

if [[ $element -gt 511 ]]; then
        (( element-= 512 ))
fi

if [[ $element -gt 255 && $element -lt 512 ]]; then
    element=$(( element - 256 ))
fi

if [[ $element -gt 127 ]]; then
    element=$(( element - 128 ))
    alergies+=("cats")
fi

if [[ $element -gt 63 ]]; then
    element=$(( element - 64 ))
    alergies=("pollen" "${alergies[@]}")
fi

if [[ $element -gt 31 ]]; then
    element=$(( element - 32 ))
    alergies=("chocolate"  "${alergies[@]}")
fi

if [[ $element -gt 15 ]]; then
    element=$(( element - 16 ))
    alergies=("tomatoes"  "${alergies[@]}")
fi

if [[ $element -gt 7 ]]; then
    element=$(( element - 8 ))
    alergies=("strawberries" "${alergies[@]}")
fi

if [[ $element -gt 3 ]]; then
    element=$(( element - 4 ))
    alergies=("shellfish" "${alergies[@]}")
fi

if [[ $element -gt 1 ]]; then
    element=$(( element - 2 ))
    alergies=("peanuts"  "${alergies[@]}")
fi

if [[ $element -gt 0 ]]; then
    element=$(( element - 1 ))
    alergies=("eggs"  "${alergies[@]}")
fi

if [[ -n "$3" ]]; then
    elm_check=$3
    found=0
    for item in "${alergies[@]}"; do
        if [[ "$elm_check" == "$item" ]]; then
            found=1
        fi
    done
	
    if [[ $found -eq 1 ]]; then
	   echo "true"
	   exit 0
    else
	   echo "false"
	   exit 0
    fi
fi

echo "${alergies[@]}"