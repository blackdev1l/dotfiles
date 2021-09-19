# Dotfiles

## i3-gnome

install with `yay -S i3-gnome`  
disable desktop window with: `gsettings set org.gnome.gnome-flashback desktop false`

## Spacemacs

`git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d && cd .emacs.d && git checkout develop`

## NeoVim

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`

## Zsh 
`yay -S zsh`
`sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
`wget https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme -P .oh-my-zsh/themes`
