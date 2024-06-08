#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PAW_PATH="$SCRIPT_DIR/share/prompt-awesome"
source "$SCRIPT_DIR/bin/prompt-awesome.sh"

sleep 10 &

__paw_prompt
echo "== NO THEME =="
echo "${PS1@P}ls -la"

prompt set-theme default
__paw_prompt
echo "== DEFAULT THEME =="
echo "${PS1@P}ls -la"

prompt set-theme minimal
echo
__paw_prompt
echo "== MINIMAL THEME =="
echo "${PS1@P}ls -la"

prompt set-theme powerline
__paw_prompt
echo "== POWERLINE THEME =="
echo "${PS1@P}ls -la"

prompt set-theme simple
__paw_prompt
echo "== SIMPLE THEME =="
echo "${PS1@P}ls -la"

prompt set-theme vscode
__paw_prompt
echo "== VSCODE THEME =="
echo "${PS1@P}ls -la"
