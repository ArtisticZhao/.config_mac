#!/bin/bash

# ------------------  alias  ------------------
alias sz="source ~/.zshrc"
alias c="clear"
# alias of programs
alias t="tmux"
alias ctags="`brew --prefix`/bin/ctags"
alias vim="nvim"
alias lg="lazygit"
alias ra="joshuto"
alias p="proxychains4"
alias cat="bat"
# venv of python
alias sv="source .venv/bin/activate"
alias dv="deactivate"
# git
alias gc="git clone"


# ------------------  keymaps ------------------

# support Home and End
bindkey "\e[1~" beginning-of-line  # Home
bindkey "\e[4~" end-of-line        # End
bindkey "\e[H" beginning-of-line   # Home
bindkey "\e[F" end-of-line         # End

# ------ zsh-history-substring-search
# Use up/down arrow to search history.
zvm_bindkey viins '^[[A' history-substring-search-up
zvm_bindkey viins '^[[B' history-substring-search-down
# bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# ------ zsh-autosuggestions
# 按-> 全部补全
# 按ctrl+w 前进一个单词
# 按ctrl+e 后退并删除一个单词
bindkey '^W' forward-word
bindkey '^E' backward-delete-word
