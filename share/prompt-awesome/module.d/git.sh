#!/usr/bin/env bash

PAW_MODULES["git"]="__paw_git"

__fast_git_branch () {
    local head_file head dir="$PWD"
    local -n output="$1"; output=""

    while [[ -n "$dir" ]]; do
        head_file="$dir/.git/HEAD"
        if [[ -f "$dir/.git" ]]; then
            read -r head_file < "$dir/.git" \
            && head_file="$dir/${head_file#gitdir: }/HEAD"
        fi
        [[ -e "$head_file" ]] && break
        dir="${dir%/*}"
    done

    if [[ -e "$head_file" ]]; then
        read -r head < "$head_file" || return
        case "$head" in
            ref:*) output="${head#ref: refs/heads/}" ;;
            "") ;;
            # HEAD detached
            *) output="${head:0:9}" ;;
        esac
    fi
}

__paw_git () {
    local -n output="$1"; output=""

    __fast_git_branch branch

    if [[ -z "${branch}" ]]; then
        return 0
    fi

    # do NOT allow shortstat to run for mor than 100ms
    # (on big projects, loading the Git index alone can take seconds!)
    local shortstat
    if ! shortstat=$(timeout 0.1 git diff --shortstat --no-color); then
        output+="${PAW_COLORS[blue]}${branch}"
        output+="${PAW_COLORS[dark_gray]}:t/o"
        output+="${PAW_COLORS[default]}"
        return 0
    fi

    local prev="" ins="" del=""
    for n in $shortstat; do
        [[ "${n:0:3}" == 'ins' ]] && ins="$prev"
        [[ "${n:0:3}" == 'del' ]] && del="$prev"
        prev="$n"
    done

    local color="${PAW_COLORS[green]}" diff=""
    if [[ ! -z "$ins" || ! -z "$del" ]]; then
        color="${PAW_COLORS[red]}"

        if [[ ! -z "$ins" ]]; then
            diff+="${PAW_COLORS[dark_gray]}/"
            diff+="${PAW_COLORS[green]}+${ins}"
            diff+="${PAW_COLORS[default]}"
        fi

        if [[ ! -z "$del" ]]; then
            diff+="${PAW_COLORS[dark_gray]}/"
            diff+="${PAW_COLORS[red]}-${del}"
            diff+="${PAW_COLORS[default]}"
        fi
    fi

    output+="${color}${branch}"
    output+="${PAW_COLORS[default]}"
    output+="${diff}"
}
