#!/usr/bin/env bash

PAW_MODULES["user_host"]="__paw_user_host"

__paw_user_host () {
    local -n output="$1"; output=""
    local user="${PAW_USER:-\\u}"
    local host="${PAW_HOST:-\\h}"

    # %user%@%hostname%
    output+="${PAW_COLORS[green]}${user@P}"
    output+="${PAW_COLORS[dark_gray]}@"
    output+="${PAW_COLORS[green]}${host@P}"
    output+="${PAW_COLORS[default]}"
}
