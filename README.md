# Configurations!

## item
- zsh
- tmux
- joshuto

## Install

### zsh
1. Install and set zsh as default shell
2. `ln -s $HOME/.config/zsh/dotzshrc $HOME/.zshrc`
3. `source ~/.zshrc`  
  The zim framework and zsh plugins will installed automatically.

### tmux
1. `brew install tmux`
2. Install tpm  
  `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
3. Install tmux plugins by tpm  
  Go tmux press `<tmux-prefix>I` to install plugins of tmux.
4. Merge my tmux-powerline theme  
  `cp -f $HOME/.config/tmux/theme.sh $HOME/.config/tmux/plugins/tmux-powerline/themes/default.sh`

### joshuto
1. `cargo install --git https://github.com/kamiyaa/joshuto.git --force`

## Usage

### zsh keybinds

| Plugins         | Keymap       | Function                                     |
|-----------------|--------------|----------------------------------------------|
| vimode          | esc esc      | enable vimode                                |
| history-search  | :arrow_up:   | history-substring-search-up                  |
|                 | :arrow_down: | history-substring-search-down                |
|                 | C-R          | history-incremental-pattern-search-backward  |
|                 | <VImode> k   | history-substring-search-up                  |
|                 | <VImode> j   | history-substring-search-down                |
| autosuggestions | C-W          | autosuggestion jump forward word             |
|                 | C-E          | autosuggestion jump backward and delete word |
| z.lua           | z <keyword>  | jump to path contains the keyword            |
|                 | zb <keyword> | jump out path contains the keyword           |
