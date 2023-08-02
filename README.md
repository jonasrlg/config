# ZSH

First, install zsh: (https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
sudo apt install zsh

Then make it the default shell:
chsh -s $(which zsh)

Log out and log in. Test that it worked with
echo $SHELL

Finally, check zsh version with
$SHELL --version

After installing zsh, install Oh My Zsh for easier plug-in and theme management (https://github.com/ohmyzsh/ohmyzsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

With Oh My Zsh installed, customize your environment with:

Syntax Highlighting (https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

Autosuggestions (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

PowerLevel10k theme (https://github.com/romkatv/powerlevel10k#oh-my-zsh)

# Neovim

```sudo dnf install -y neovim python3-neovim```

[Extenssions](https://github.com/rockerBOO/awesome-neovim) and [Themes](https://github.com/rafi/awesome-vim-colorschemes).
