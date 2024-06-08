#!/usr/bin/env bash

PAW_MODULES["timer"]="__paw_timer"

__paw_timer () {
    local -n output="$1"; output=""
    local time=$(($SECONDS - ${PROMPT_TIMER:-$SECONDS}))
    local code=${PAW_EXIT_CODE:-0}
    local color

    if [[ "$code" == 0 || "$code" == 130 ]]
        then color="${PAW_COLORS[green]}"
        else color="${PAW_COLORS[red]}"
    fi

    output="${color}${time:-0}s${PAW_COLORS[default]}"

    unset PROMPT_TIMER
}

__paw_timer_trap () {
    PROMPT_TIMER=${PROMPT_TIMER:-$SECONDS}
}

trap '__paw_timer_trap' DEBUG
