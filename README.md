# Configurations!

## Configure items
- zsh
- tmux
- joshuto
- fzf
- lazygit

## Install

### zsh
1. Install and set zsh as default shell
2. `ln -s $HOME/.config/zsh/dotzshrc $HOME/.zshrc`
3. `source ~/.zshrc`  
  The zim framework and zsh plugins will installed automatically.
4. Install requirements.  
  `brew install exa` for pretty ls
  `brew install bat` for cat

### tmux
1. `brew install tmux`
2. Install tpm  
  `git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm`
3. Install tmux plugins by tpm  
  Go tmux press `<tmux-prefix>I` to install plugins of tmux.
4. Merge my tmux-powerline theme  
  `cp -f $HOME/.config/tmux/theme.sh $HOME/.config/tmux/plugins/tmux-powerline/themes/default.sh`

### joshuto
1. `cargo install --git https://github.com/kamiyaa/joshuto.git --force`

### fzf
1. Install fzf  
  `brew install fzf`
2. To install useful key bindings and fuzzy completion  
  `(brew --prefix)/opt/fzf/install --xdg`
3. Install requirements: fd, rg.  
  `brew install fd` for fast find  
  `brew install rg` for grep content in files  

### lazygit
1. Install lazygit  
  `brew install lazygit`
2. Install git-delta to show diff  
  `brew install git-delta`

## Usage

| Plugins         | Keymap           | Function                                                       |
|-----------------|------------------|----------------------------------------------------------------|
| vimode          | ESC ESC          | enable vimode                                                  |
| history-search  | :arrow_up:       | history-substring-search-up                                    |
|                 | :arrow_down:     | history-substring-search-down                                  |
|                 | C-R              | history-incremental-pattern-search-backward                    |
|                 | \<VImode\> k     | history-substring-search-up                                    |
|                 | \<VImode\> j     | history-substring-search-down                                  |
| autosuggestions | C-W              | autosuggestion jump forward word                               |
|                 | C-E              | autosuggestion jump backward and delete word                   |
| z.lua           | $ z \<keyword\>  | jump to path contains the keyword                              |
|                 | $ zb \<keyword\> | jump out path contains the keyword                             |
| fzf             | C-T              | Paste the selected files and directories onto the command-line |
|                 | C-R              | fzf command history                                            |
|                 | M-C              | cd into the selected directory                                 |
