#!/usr/bin/env bash

PAW_MODULES["pwd"]="__paw_pwd"

declare -A apparix
while IFS= read -ra line; do
    parts=(${line//,/ })
    apparix["${parts[2]}"]="${parts[1]}"
    unset parts
done < "$HOME/.apparixrc"

__paw_pwd () {
    local -n output="$1"; output=""
    local max="0" short relative len

    # look for an apparix alias matching current directory
    for key in "${!apparix[@]}"; do
        if [[ "$PWD/" = "$key/"* ]]; then
            len="${#key}"
            if [ "$len" -gt "$max" ]; then
                short="${apparix["$key"]}"
                relative="${PWD#"$key"}"
                max="$len"
            fi
        fi
    done

    # if an alias is found, print the relative path
    if [ "$max" -gt "0" ]; then
        output+="${PAW_COLORS[dark_gray]}${short}:"
        output+="${PAW_COLORS[yellow]}${relative:-"/"}"
        output+="${PAW_COLORS[default]}"
        return
    fi

    # default behavior, just print the current working directory
    local pwd="\w"
    [[ "${#PWD}" -gt 40 ]] && pwd="../\\W"
    output+="${PAW_COLORS[yellow]}${pwd}"
    output+="${PAW_COLORS[default]}"
}
