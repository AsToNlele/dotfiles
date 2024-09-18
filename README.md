# My dotfiles!

Includes neovim, tmux, terminal and zsh config

## Put files in their folders, backup your files first

1. `brew install stow`
2. Clone in ~/dotfiles
3. `stow .`

## Zsh

### Oh-my-zsh
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### Powerlevel10k (prompt)
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

## iTerm2

### Get Font

[JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip)

### Load settings

1. General > Settings
2. Check "Load settings from a custom folder or URL"
3. Set path to "/Users/yourUserName/.config/iterm2"
4. Save changes Automatically

## Tmux

### Tmux plugin manager

1. Get tpm
   `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
2. Open a tmux session
3. `prefix` + <kbd>I</kbd> to install plugins

### Get theme

1. `git clone https://github.com/AsToNlele/tmux-theme.git ~/.tmux/plugins/tmux-theme`
