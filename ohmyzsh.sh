#!/bin/bash

# Install zsh
sudo apt-get update
sudo apt-get install -y zsh

# Set zsh as the default shell
if chsh -s $(which zsh); then
    echo "Successfully set zsh as the default shell"
else
    echo "Failed to set zsh as the default shell. Please enter your password:"
    if sudo chsh -s $(which zsh); then
        echo "Successfully set zsh as the default shell"
    else
        echo "Failed to set zsh as the default shell"
    fi
fi
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Set Powerlevel10k as the theme in ~/.zshrc
echo "ZSH_THEME=powerlevel10k/powerlevel10k" >> ~/.zshrc

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Append plugins to .zshrc
echo "plugins=(git jump zsh-autosuggestions sublime zsh-history-substring-search jsontools zsh-syntax-highlighting zsh-interactive-cd)" >> ~/.zshrc
source ~/.zshrc