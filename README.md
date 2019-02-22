# About

Based on [this](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

# Docker

## VPS setup

_NOTE: There's no need to set up multiple user accounts._

1. Install Docker and mosh.
2. `docker pull botanicus/dev`
3. Generate SSH a pair of SSH keys.
4. `docker create -it -p 3000-3005:3000-3005 -p 4000-4005:4000-4005 -e DROPBOX_ACCESS_TOKEN=$DROPBOX_ACCESS_TOKEN -v ~/.ssh:/root/.ssh --name riffr --hostname riffr botanicus/dev && docker start riffr`
5. Run `ssh-copy-id` on iPad (unless it was already added by DigitalOcean).
6. Update mosh start-up command to `DROPBOX_ACCESS_TOKEN=... docker attach riffr`

_I might use 1 VM with multiple images, more users, and exporting a different range for each project and then `mosh riffr@server` etc. One thing is it should have the same user, otherwise proxying between host and guest `~/.ssh` screws permissions._

```
docker container ls -a
docker build -t botanicus/dev .
docker push botanicus/dev
```

# TODO

- Git add completion for git-custom scripts.
- OS X installation.
- Review https://github.com/mathiasbynens/dotfiles/blob/master/.macos (no sleep mode, maybe I don't need Caffeine). sudo systemsetup -setcomputersleep Off > /dev/null
- https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.8ilwpjaj5
- Vim: syntax for Nginx conf files.
