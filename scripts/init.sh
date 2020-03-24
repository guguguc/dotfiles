# init
echo "[*] starting to update mirrors"
sudo pacman-mirrors -i -c Chinae -m rank
sudo pacman-mirrors -g

echo "[*] starting to update system"
sudo pacman -Syyu
# use local time
sudo timedatectl set-local-rtc true

# software install
echo "[*] starting to install"
yay -S clang llvm gdb guake nvim code typora sublime-text-dev docker docker-compose
# oh-my-zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh-plug
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
cp -v ../scripts/.zshrc ~

# neovim config
echo "[*] starting to config vim-plug";
cp -v ../neovim/plug.vim ~/.local/share/nvim/site/autoload
mkdir ~/.config/nvim
cp -v ../neovim/init.vim ~/.config/nvim

