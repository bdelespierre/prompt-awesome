#!/usr/bin/env bash

# usage: source ps1.sh

# -----------------------------------------------------------------------------
# LOAD MODULES
# -----------------------------------------------------------------------------
#
declare -A \
    PAW_PREFIXES \
    PAW_SUFFIXES \
    PAW_MODULES \
    PAW_COLORS

export \
    PAW_PREFIXES \
    PAW_SUFFIXES \
    PAW_MODULES \
    PAW_COLORS

IFS=':' read -ra dirs <<< "$PAW_PATH"
for dir in "${dirs[@]}"; do
    if [[ -z "$dir" ]] || [[ ! -d "$dir/module.d" ]]; then
        continue
    fi

    for file in "$dir"/module.d/*.sh; do
        source "$file"
    done
done

# -----------------------------------------------------------------------------
# PROMPT
# -----------------------------------------------------------------------------
#
PROMPT_COMMAND='PAW_EXIT_CODE=$? __paw_prompt'

__paw_prompt () {
    local left="" right=""

    if [[ "${PAW_NEWLINE:-1}" == "1" ]]; then
        # newline (does not appear after clear)
        echo >&2
    fi

    __paw_expand_modules left "${PAW_LEFT[@]}"

    if [[ -n "$left" ]]; then
        if [[ "${PAW_NEWLINE_PROMPT:-1}" == "1" ]];
            then left="$left\n"
            else left="$left "
        fi
    fi

    # print left side
    PS1="$left${PAW_COLORS[dark_gray]}\\\$${PAW_COLORS[reset]} "

    __paw_expand_modules right "${PAW_RIGHT[@]}"

    if [[ -n "$right" ]]; then
        __paw_prompt_right "$right"
    fi

    if [[ -n "$PAW_TITLE" ]]; then
        PS1="${PS1}\[\e]2;${PAW_TITLE}\a\]"
    fi
}

__paw_prompt_right () {
    local right="$1"

    # trim trailing spaces
    right="${right%" "}"

    # remove all formatting from $right
    shopt -s extglob
    local right_text="${right//\\\[\\e\[*([^m])m\\\]/}"
    local right_len=${#right_text}

    # determine the lenght of the horizontal padding
    local pad
    for ((i=0; i<COLUMNS-right_len; i++)); do
        pad+=" "
    done

    # print right-side, then return, then print left
    PS1="${pad}${right}\r${PS1}"
}

__paw_expand_modules () {
    local -n output="$1"; output=""

    shift
    for module in "$@"; do
        if [[ -z "${PAW_MODULES[$module]}" ]]; then
            continue
        fi

        "${PAW_MODULES[$module]}" out

        if [[ -n $out ]]; then
            if [[ -n "${PAW_PREFIXES[$module]:-}" ]]; then
                out="${PAW_PREFIXES[$module]}${out}"
            fi

            if [[ -n "${PAW_SUFFIXES[$module]:-}" ]]; then
                out="${out}${PAW_SUFFIXES[$module]}"
            fi

            output+="$out "
        fi

        unset out
    done

    # trim trailing spaces
    output="${output%" "}"
}

# -----------------------------------------------------------------------------
# (AWESOME) PROMPT COMMAND
# -----------------------------------------------------------------------------
#
prompt () {
    case "$1" in
        "set-var")
            shift
            __paw_set_var $@
            ;;

        "set-theme")
            shift
            __paw_set_theme $@
            ;;

        "set-title")
            shift
            __paw_set_title $@
            ;;

        *)
            echo "Invalid command: $1"
            return
            ;;
    esac
}

__paw_set_var () {
    local var="$1"
    local val="$2"
    local accepted=("user" "host" "tty" "shell")

    if [[ -z "$var" ]]; then
        echo "Missing argument: variable" >&2
        return
    fi

    if [[ ! "${accepted[@]}" =~ "${var}" ]]; then
        echo "Invalid variable name: $var" >&2
        echo "Accepted variable names are: ${accepted[@]}" >&2
        return
    fi

    if [[ -z "$val" ]]; then
        read -p "${var^^}: " val
    fi

    declare -g "PAW_${var^^}"="$val"
}

__paw_set_theme () {
    local theme="$1"

    # reset global variables
    PAW_LEFT=()
    PAW_RIGHT=()
    PAW_PREFIXES=()
    PAW_SUFFIXES=()
    PAW_NEWLINE=1
    PAW_NEWLINE_PROMPT=1

    # reset color palette
    __paw_load_color_palette

    IFS=':' read -ra dirs <<< "$PAW_PATH"
    for dir in "${dirs[@]}"; do
        if [[ -f "$dir/theme.d/$theme.sh" ]]; then
            source "$dir/theme.d/$theme.sh"
        fi
    done
}

__paw_set_title () {
    PAW_TITLE="$@"
}

__paw_load_color_palette () {
    IFS=':' read -ra dirs <<< "$PAW_PATH"
    for dir in "${dirs[@]}"; do
        if [[ -f "$dir/colors.d/${1:-default}.sh" ]]; then
            source "$dir/colors.d/${1:-default}.sh"
        fi
    done
}

# -----------------------------------------------------------------------------
# LOAD DEFAULT COLOR PALETTE
# -----------------------------------------------------------------------------
#
__paw_load_color_palette
