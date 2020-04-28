# Shell Learning

- [Shell Learning](#shell-learning)
  - [Some third-party extension](#some-third-party-extension)
    - [Iterm2](#iterm2)
    - [zsh](#zsh)
    - [Homebrew](#homebrew)
  - [Commen Commands](#commen-commands)
    - [Basic Operation](#basic-operation)
    - [User Management](#user-management)
    - [File download and unzip](#file-download-and-unzip)
    - [Manage Process](#manage-process)
    - [Manage Portals](#manage-portals)
    - [Mysql in Centos](#mysql-in-centos)


* [Server Information](Server%20Information.md)

## Some third-party extension

### Iterm2

ITerm2 is one of the best terminal tools in mac.

Here is some [material](http://wulfric.me/2015/08/iterm2/) about how to use Iterm2

### zsh

zsh is a bash-compatible and fully replaceable shell that provides a range of features more powerful than bash.

It is very easy to install by using brew

```brew install zsh```

After install the zsh we also need to change terminal to the zsh style.

```sudo sh -c 'echo $(which zsh) >> /etc/shells'```
```chsh -s $(which zsh)```

### oh-my-zsh

This is a tool to make the zsh configuration easier to manage.

Install oh-my-zsh

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

save themes in ```~/.oh-my-zsh/themes/``` file path

change ```!/.zshrc``` file ```ZSH_THEME="robbyrussell"``` robbyrussell to your themes

then rerun terminal ```exec $SHELL```

There is a good themes call [powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)

copy whole powerlevel9k root file to the themes of zsh, and change the zsh_theme to the ```powerlevel9k/powerlevel9k``` themes

Also you need to install the font

### Homebrew

The Missing Package Manager for macOS (or Linux)

[Official Website](https://brew.sh/)

## Commen Commands

### [Basic Operation](Basic%20Operation.md)
### [User Management](User%20Management.md)
### [File download and unzip](File%20download%20and%20unzip.md)
### [Manage Process](Manage%20process.md)
### [Manage Portals](Manage%20Portals.md)
### [Mysql in Centos](Mysql%20in%20Centos.md)