#!/usr/bin/env bash

PAW_MODULES["jobs"]="__paw_jobs"

__paw_jobs () {
    local -n output="$1"; output=""
    local color jobs=()

    while read -r line; do
        IFS=" " set -- $line

        if [[ -z $3 ]]; then
            continue
        fi

        if [[ "$2" == "Running" ]]
            then color="${PAW_COLORS[green]}"
            else color="${PAW_COLORS[yellow]}"
        fi

        jobs+=("${PAW_COLORS[dark_gray]}$1${color}$3${PAW_COLORS[default]}")
    done < <(jobs)

    if [[ -n "${jobs:-}" ]]; then
        output="${jobs[@]}${PAW_COLORS[default]}"
    fi
}
