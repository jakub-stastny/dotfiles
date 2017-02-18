# About

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

# Installation

## Ubuntu

```
# Run on your local machine that has dotfiles installed already:
~/.scripts/dotfiles.install-remote.sh root@104.236.127.89
```

## OS X

```
TODO
```

# TODO

- Push dotfiles every night.
- Git add completion for git-custom scripts.
- At the end of every month create %Y-%m folder in Camera Uploads and move all the pics in it.
- Can I see which dotfiles are not committed? From .scripts .vim etc.
- OS X installation.
- Launchd script to run ~/.scripts/system-update.
- Review https://github.com/mathiasbynens/dotfiles/blob/master/.macos (no sleep mode, maybe I don't need Caffeine). sudo systemsetup -setcomputersleep Off > /dev/null
- https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.8ilwpjaj5
 2248  chflags hidden ~/Dropbox/1Password
 2249  chflags hidden ~/Dropbox/Apps
