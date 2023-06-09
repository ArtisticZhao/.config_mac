#               _____    _____
#              |  ___|__|  ___|
#              | |_ |_  / |_
#              |  _| / /|  _|
#              |_|  /___|_|

# ------------------  BASIC  ------------------
export FZF_COMPLETION_TRIGGER='\'
# follow symbolic links and don't want it to exclude hidden files, use the following command
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
# Start fzf in a tmux popup window in tmux-session
export FZF_TMUX_OPTS='-p80%,60%'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# **vim \<tab>** will run this function!
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# **cd \<tab>** will run this function!
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# ------------------  C-F: find in files  ------------------
find-in-file() {
    #!/bin/bash

    ##
    # Interactive search.
    # Usage: `ff` or `ff <folder>`.
    #
    [[ -n $1 ]] && cd $1 # go to provided folder or noop
    RG_DEFAULT_COMMAND="rg -i -l --hidden --no-ignore-vcs"

    selected=$(
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m \
      -e \
      --ansi \
      --phony \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "change:reload:$RG_DEFAULT_COMMAND {q} || true" \
      --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
    )

    [[ -n $selected ]] && vim $selected # open multiple files in editor
}
zle -N find-in-file
bindkey '^F' find-in-file


# enable FZF
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
