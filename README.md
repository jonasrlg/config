# ZSH

Install `ZSH` and make it the default shell:
```
sudo dnf install zsh
chsh -s $(which zsh)
```

Logout and login. Chek shell and shell version with
```
echo $SHELL
$SHELL --version
```

Then install [Oh-My-ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) for easier plug-in and theme management.

With Oh My Zsh installed, customize your environment by inserting the next line to your `.zshrc`

```
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
```

The installation of the above extesions can be found at: [Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md),
[Autosuggestions] (https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md),[PowerLevel10k Theme] (https://github.com/romkatv/powerlevel10k#oh-my-zsh)

# Neovim

Installation:

```sudo dnf install -y neovim python3-neovim```

(Neo)Vim [plugin manager](https://github.com/junegunn/vim-plug) for easy installation of [extensions](https://github.com/rockerBOO/awesome-neovim) and [themes](https://github.com/rafi/awesome-vim-colorschemes).

Auxiliary CoC (Conqueror of Completion) [extesions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions): `coc-julia`, `coc-pyright` and `coc-sql`. 
