# About

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

# Installation

## Arch

```
pacman -Syu && pacman -S git
git clone git@github.com:botanicus/dotfiles.git .dotfiles --bare
ssh-keygen -t rsa -b 4096 -C james@gunpowderlabs.com
```

## Ubuntu

```
# Run on your local machine that has dotfiles installed already:
~/.scripts/dotfiles/dotfiles.install-remote.sh root@104.236.127.89
```

## OS X

```
TODO
```

# TODO

- Git add completion for git-custom scripts.
- OS X installation.
- Review https://github.com/mathiasbynens/dotfiles/blob/master/.macos (no sleep mode, maybe I don't need Caffeine). sudo systemsetup -setcomputersleep Off > /dev/null
- https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.8ilwpjaj5
- Vim: syntax for Nginx conf files.
