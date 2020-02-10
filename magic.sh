#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

source scripts/link.sh

#source scripts/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\\n\\nRunning on macOS"

    if test ! "$( command -v brew )"; then
        echo "Installing homebrew"
        ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
    fi

    # install brew dependencies from Brewfile
    # brew bundle

    # clone vundle into dotfiles associated folder
    if [ ! -d "$HOME/.dotfiles/config/nvim/bundle" ]; then
        echo "Creating ~/.dotfiles/config/nvim/bundle"
        mkdir -p "$HOME/.dotfiles/config/nvim/bundle"
    fi

    if [ -e "$HOME/.dotfiles/config/nvim/bundle/VundleVim" ]; then
        echo "~/.dotfiles/config/nvim/bundle/VundleVim already exists... Skipping."
    else
        echo "Cloning VundleVim"
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/config/nvim/bundle/VundleVim
    fi

    # download vim-plug into dotfiles associated folder
    if [ -e "$HOME/.dotfiles/config/nvim/autoload/plug.vim" ]; then
        echo "VimPlug already installed"
    else
        curl -fLo ~/.dotfiles/config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    # download vim-plug into dotfiles associated folder
    if [ -e "$HOME/.dotfiles/tmux/plugins/tpm" ]; then
        echo "tmux plugin manager already installed"
    else
        mkdir -p "$HOME/.dotfiles/config/tmux/plugins"
        git clone https://github.com/tmux-plugins/tpm $HOME/.dotfiles/tmux/plugins/tpm
    fi

    # download powerlevel9k into zsh custom folder 
    if [ -e "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k" ]; then
        echo "powerlevel9k already installed"
    else
        git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
    fi

    # After the install, setup fzf
    echo -e "\\n\\nRunning fzf install script..."
    echo "=============================="
    /usr/local/opt/fzf/install --all --no-bash --no-fish

    # after the install, install neovim python libraries
    echo -e "\\n\\nRunning Neovim Python install"
    echo "=============================="
    # pip3 install pynvim

    # Change the default shell to zsh
    zsh_path="$( command -v zsh )"
    if ! grep "$zsh_path" /etc/shells; then
        echo "adding $zsh_path to /etc/shells"
        echo "$zsh_path" | sudo tee -a /etc/shells
    fi

    if [[ "$SHELL" != "$zsh_path" ]]; then
        chsh -s "$zsh_path"
        echo "default shell changed to $zsh_path"
    fi

fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s "$(command -v zsh)"
fi

# Change the default shell to zsh
zsh_path="$( command -v zsh )"
if ! grep "$zsh_path" /etc/shells; then
    echo "adding $zsh_path to /etc/shells"
    echo "$zsh_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$zsh_path" ]]; then
    chsh -s "$zsh_path"
    echo "default shell changed to $zsh_path"
fi

echo "Done. Reload your terminal."
