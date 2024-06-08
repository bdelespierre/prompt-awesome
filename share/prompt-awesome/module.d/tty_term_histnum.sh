#!/usr/bin/env bash

PAW_MODULES["tty_term_histnum"]="__paw_tty_term_histnum"

__paw_tty_term_histnum () {
    local -n output="$1"; output=""
    local tty="${PAW_TTY:-\\l}"
    local shell="${PAW_SHELL:-\\s}"
    local histnum="\\!"

    if [[ "$tty" == "auto" ]]; then
        tty="\\l"
        tty="${tty@P}"

        if [[ "${tty:0:3}" != "tty" ]]; then
            tty=$(readlink /dev/fd/0)
            tty=${tty#/dev/}
        fi
    fi

    # #%tty%#%term%!%histnum%
    output+="${PAW_COLORS[dark_gray]}${PAW_COLORS[blue]}${shell}"
    output+="${PAW_COLORS[dark_gray]}#${PAW_COLORS[blue]}${tty} "
    output+="${PAW_COLORS[dark_gray]}!${PAW_COLORS[magenta]}${histnum}"
    output+="${PAW_COLORS[default]}"
}
