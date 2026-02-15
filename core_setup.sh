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
brew install tmux
brew install --cask font-fira-code-nerd-font
brew install neovim
brew install starship
brew install nvm
brew install gh
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install carapace

# Backup zshrc, nvim, aerospace and starship configs by moving them (only if not symlinks)
if [ -f ~/.tmux.conf ] && [ ! -L ~/.tmux.conf ]; then mv ~/.tmux.conf ~/.tmux.conf.ms.bak; fi
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then mv ~/.config/nvim ~/.config/nvim.ms.bak; fi
if [ -f ~/.config/starship.toml ] && [ ! -L ~/.config/starship.toml ]; then mv ~/.config/starship.toml ~/.config/starship.toml.ms.bak; fi
if [ -f ~/.config/karabiner/karabiner.json ] && [ ! -L ~/.config/karabiner/karabiner.json ]; then mv ~/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json.ms.bak; fi

# Stow the dotfiles (use restow if already stowed)
cd ~/mac-setup/dotfiles/
if [ -L ~/.zshrc_portable ] || [ -L ~/.zshrc ]; then
  stow -R . -t ~/
else
  stow . -t ~/
  if [ ! -f ~/.zshrc ]; then
    echo "source ~/.zshrc_portable" >>~/.zshrc
  fi
fi
