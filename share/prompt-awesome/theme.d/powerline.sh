#!/usr/bin/env bash
#
# Note: This theme is designed to work with the amazing JetBrains Mono font
# See https://www.jetbrains.com/lp/mono/ for installation instructions
#

# use default colors for prefixe and suffixes
__paw_load_color_palette

# left side
PAW_PREFIXES["user_host"]="${PAW_COLORS[bg_green]} "
PAW_SUFFIXES["user_host"]=" ${PAW_COLORS[bg_blue]}${PAW_COLORS[green]}${PAW_COLORS[black]}"

PAW_PREFIXES["time"]=""
PAW_SUFFIXES["time"]=" ${PAW_COLORS[bg_magenta]}${PAW_COLORS[blue]}${PAW_COLORS[black]}"

PAW_PREFIXES["tty_term_histnum"]=""
PAW_SUFFIXES["tty_term_histnum"]=" ${PAW_COLORS[bg_yellow]}${PAW_COLORS[magenta]}${PAW_COLORS[black]}"

PAW_PREFIXES["pwd"]=""
PAW_SUFFIXES["pwd"]=" ${PAW_COLORS[bg_default]}${PAW_COLORS[yellow]}${PAW_COLORS[reset]}"

PAW_LEFT=("user_host" "time" "tty_term_histnum" "pwd")

# right Side
PAW_PREFIXES["jobs"]="${PAW_COLORS[yellow]}${PAW_COLORS[black]}${PAW_COLORS[bg_yellow]} "
PAW_SUFFIXES["jobs"]=""

PAW_PREFIXES["git"]="${PAW_COLORS[cyan]}${PAW_COLORS[black]}${PAW_COLORS[bg_cyan]}  "
PAW_SUFFIXES["git"]=""

PAW_PREFIXES["timer"]="${PAW_COLORS[magenta]}${PAW_COLORS[black]}${PAW_COLORS[bg_magenta]} "
PAW_SUFFIXES["timer"]=" ${PAW_COLORS[bg_default]}"

PAW_RIGHT=("jobs" "git" "timer")

# now load the powerline color palette
__paw_load_color_palette "powerline"
