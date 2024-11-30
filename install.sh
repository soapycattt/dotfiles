#!/usr/bin/env bash

# Exit on error
set -e

# Get script directory
cd "$(dirname "${BASH_SOURCE}")"
CWD=$(pwd)

printf "# Starting dotfiles installation...\n"

# Function to sync dotfiles
function syncFile() {
    local sourceFile="$1"
    ln -sf "$CWD/${sourceFile}" "$HOME/${sourceFile}"
}

            # Function to install Oh My Zsh plugins
function install_zsh_plugin() {
    local plugin_name="$1"
    local plugin_url="$2"
    echo "Installing ${plugin_name}..."
    git clone "$plugin_url" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/$plugin_name"
}
            

function doSync() {
    # Add your dotfiles here
    syncFile ".zshrc"
    syncFile ".gitconfig"
    syncFile ".tmux.conf"
    
    # Add any specific symlinks
    ln -fs ~/dotfiles/nvim ~/.config/
    ln -fs ~/dotfiles/skhd ~/.config/
    ln -fs ~/dotfiles/yabai ~/.config/
    ln -fs ~/dotfiles/yazi ~/.config/
    ln -fs ~/dotfiles/hammerspoon ~/.config/
    ln -fs ~/dotfiles/karabiner ~/.config/
    
    return 0
}

# Prompt for confirmation unless force flag is used
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doSync
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doSync
    else
        printf "Skipped.\n\n"
    fi
fi

# Package managers installation
function install_package_managers() {
    # Install Oh My Zsh if not installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        
        # Install Oh My Zsh plugins
        install_zsh_plugin "forgit" "https://github.com/wfxr/forgit.git"
        install_zsh_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
        install_zsh_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
        
        # Install powerlevel10k theme
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
}

# Install development tools
function install_dev_tools() {
  # Oh-my-zsh should already contains asdf, sdk and brew
  # Install asdf version manager
  read -p "Install asdf packages? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install plugins and versions
    asdf plugin add python
    asdf plugin add golang
    asdf plugin add nodejs
    asdf plugin add postgres
    asdf plugin add neovim


      # Install latest stable versions
      asdf install python latest
      asdf install golang latest
      asdf install nodejs latest
      asdf install postgres latest
      asdf install neovim latest

      # Set global versions
      asdf global python latest
      asdf global golang latest
      asdf global nodejs latest
      asdf global postgres latest
      asdf global neovim latest
  fi

  # Install SDKMAN
  read -p "Install SDKMAN packages? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # curl -s "https://get.sdkman.io" | bash
    # source "$HOME/.sdkman/bin/sdkman-init.sh"

      # Install Java and Scala
      sdk install java 11.0.21-open
      sdk install scala 2.13.12

      # Set default versions
      sdk default java 11.0.21-open
      sdk default scala 2.13.12
  fi

  read -p "Install Homebrew packages? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Install packages from Brewfile
    if [ -f ~/dotfiles/Brewfile ]; then
      brew bundle --file=~/dotfiles/Brewfile
    else
      echo "Brewfile not found in ~/dotfiles"
      return 1
    fi
  fi
}

# Run installations
# install_package_managers
install_dev_tools
# install_package_managers

echo ""
echo "🎉 All done! Please restart your terminal." 
