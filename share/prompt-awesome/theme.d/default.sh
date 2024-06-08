#!/usr/bin/env bash

PAW_PREFIXES["time"]="${BASH_COLORS[dark_gray]}at${BASH_COLORS[reset]} "
PAW_PREFIXES["git"]="${BASH_COLORS[dark_gray]}on${BASH_COLORS[reset]} "
PAW_PREFIXES["timer"]="${BASH_COLORS[dark_gray]}took${BASH_COLORS[reset]} "
PAW_PREFIXES["jobs"]="${BASH_COLORS[dark_gray]}jobs${BASH_COLORS[reset]} "
PAW_PREFIXES["pwd"]="${BASH_COLORS[dark_gray]}in${BASH_COLORS[reset]} "
PAW_LEFT=("user_host" "time" "tty_term_histnum" "pwd")
PAW_RIGHT=("jobs" "git" "timer")
