#!/usr/bin/env bash

PAW_MODULES["time"]="__paw_time"

__paw_time () {
    local -n output="$1"; output=""
    local time="\\@"

    time="${time@P}"
    time="${time%" PM"}"
    time="${time%" AM"}"
    time=(${time//:/ })

    # %h:i%
    output+="${PAW_COLORS[yellow]}${time[0]}"
    output+="${PAW_COLORS[dark_gray]}:"
    output+="${PAW_COLORS[yellow]}${time[1]}"
    output+="${PAW_COLORS[default]}"
}
