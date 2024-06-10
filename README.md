# Prompt Awesome 😎

A modular PS1 generator written in pure bash with big chunks of :sparkling_heart:

<p align="center"><img src="/demo.gif?raw=true"/></p>

> Like what you see? support me with a `star` and a `follow` 😘

## Installation

``` bash
git clone https://github.com/bdelespierre/prompt-awesome.git
cd prompt-awesome
mkdir -p ~/.local/{bin,share}
cp bin/prompt-awesome.sh ~/.local/bin/
cp -rp share/ ~/.local/share
```

Then copy/paste this to your `~/.bashrc`:

``` bash
# -----------------------------------------------------------------------------
# AWESOME PROMPT
# -----------------------------------------------------------------------------
#
PAW_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/prompt-awesome"

# Windows equivalent of $HOME/.local/share
# is %LOCALAPPDATA% (e.g. C:\Users\Someone\Appdata\Local)
if [[ -n "$LOCALAPPDATA" ]]; then
    PAW_PATH="$PAW_PATH:$(cygpath "$LOCALAPPDATA")/prompt-awesome"
fi

export PAW_PATH

if [ -f "${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions/prompt" ]; then
    source "${XDG_DATA_HOME:-$HOME/.local/share}/bash-completion/completions/prompt"
    complete -o default -o nospace -F _prompt prompt
fi

if [ -f "$HOME/.local/bin/prompt-awesome.sh" ]; then
    source "$HOME/.local/bin/prompt-awesome.sh"
fi
```

## Usage

``` bash
# change theme
prompt set-theme default
prompt set-theme minimal
prompt set-theme powerline
prompt set-theme simple
prompt set-theme vscode

# change a variable
prompt set-var user Superman
prompt set-var host Krypton
prompt set-var tty 99
prompt set-var shell SuperBash!

# change the tab title
prompt set-title My Awesome Bash Session!
```
