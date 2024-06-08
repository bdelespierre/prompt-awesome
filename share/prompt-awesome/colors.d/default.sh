#!/usr/bin/env bash

PAW_COLORS=(

    # -------------------------------------------------------------------------
    # SPECIAL
    # -------------------------------------------------------------------------
    #
    ["reset"]='\[\e[0m\]'
    ["bold"]='\[\e[1m\]'
    ["blink"]='\[\e[5m\]'

    # -------------------------------------------------------------------------
    # FOREGROUND
    # -------------------------------------------------------------------------
    #
    ["default"]='\[\e[39m\]'
    ["white"]='\[\e[97m\]'
    ["black"]='\[\e[30m\]'

    ["red"]='\[\e[31m\]'
    ["green"]='\[\e[32m\]'
    ["yellow"]='\[\e[33m\]'
    ["blue"]='\[\e[34m\]'
    ["magenta"]='\[\e[35m\]'
    ["cyan"]='\[\e[36m\]'
    ["dark_gray"]='\[\e[90m\]'

    ["light_red"]='\[\e[91m\]'
    ["light_green"]='\[\e[92m\]'
    ["light_yellow"]='\[\e[93m\]'
    ["light_blue"]='\[\e[94m\]'
    ["light_magenta"]='\[\e[95m\]'
    ["light_cyan"]='\[\e[96m\]'
    ["light_gray"]='\[\e[37m\]'

    # -------------------------------------------------------------------------
    # BACKGROUND
    # -------------------------------------------------------------------------
    #
    ["bg_default"]='\[\e[49m\]'
    ["bg_white"]='\[\e[107m\]'
    ["bg_black"]='\[\e[40m\]'

    ["bg_red"]='\[\e[41m\]'
    ["bg_green"]='\[\e[42m\]'
    ["bg_yellow"]='\[\e[43m\]'
    ["bg_blue"]='\[\e[44m\]'
    ["bg_magenta"]='\[\e[45m\]'
    ["bg_cyan"]='\[\e[46m\]'
    ["bg_dark gray"]='\[\e[100m\]'

    ["bg_light_red"]='\[\e[101m\]'
    ["bg_light_green"]='\[\e[102m\]'
    ["bg_light_yellow"]='\[\e[103m\]'
    ["bg_light_blue"]='\[\e[104m\]'
    ["bg_light_magenta"]='\[\e[105m\]'
    ["bg_light_cyan"]='\[\e[106m\]'
    ["bg_light_gray"]='\[\e[47m\]'
)