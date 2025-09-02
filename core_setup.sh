# Install packages
brew install zoxide
brew install ripgrep
brew install fd
brew install htop
brew install jq
brew install stow
brew install fzf
brew install bat
brew install eza
brew install lazygit
brew install --cask nikitabobko/tap/aerospace
brew install tmux
brew install --cask font-fira-code-nerd-font
brew install neovim
brew install starship
brew install nvm
brew install gh

# Backup zshrc, nvim, aerospace and starship configs by moving them
mv ~/.zshrc ~/.zshrc.ms.bak
mv ~/.tmux.conf ~/.tmux.conf.ms.bak
mv ~/.config/nvim ~/.config/nvim.ms.bak
mv ~/.config/starship.toml ~/.config/starship.toml.ms.bak
mv ~/.config/aerospace ~/.config/aerospace.ms.bak

# Stow the dotfiles
cd ~/mac-setup/dotfiles/ && stow . -t ~/
