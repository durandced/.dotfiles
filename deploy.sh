#! /bin/bash


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -s $(pwd)/.zsh_custom  ~/
ln -s $(pwd)/.zshrc ~/
ln -s $(pwd)/.emacs ~/
ln -s $(pwd)/.emacs.conf ~/ 
ln -s $(pwd)/.gitconfig ~/
ln -s $(pwd)/.p10k.zsh ~/
