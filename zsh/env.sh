#!/bin/bash
# ------------------  ENV  ------------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ALL_PROXY=127.0.0.1:7890
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"

export XDG_CONFIG_HOME="$HOME/.config"

PATH="$PATH:/opt/homebrew/bin"
PATH="$PATH:/Users/az/Library/Python/3.9/bin"
PATH="$PATH:/Users/az/.cargo/bin"
export PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=true
export EDITOR=nvim


# ------------------ plugins' ENV  ------------------
ZVM_INIT_MODE=sourcing
ZVM_LAZY_KEYBINDINGS=false
export FZF_COMPLETION_TRIGGER='\'
