# Prompt Awesome 😎

An awesome PS1 generator written in pure bash.

PICTURE GOES HERE

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
prompt set-theme powerline
```
