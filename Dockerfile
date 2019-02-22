# Dockerfiles should have chruby and ruby-install.
#
# Or all should be in Docker, therefore there's no need for ruby outside ( I can have it here for pry, but not for running apps )
#
# ISSUES
# I cannot run everything there. For one thing, there's no init.
#       Shall I run init?
#       I can have a top-level tmux, zsh and ruby and in docker neovim ag git etc and make bunch of aliases to these.
#  volumes (viminfo etc)
# Mosh run command:
# sudo docker run -it -e DROPBOX_TOKEN=... dockerfiles
# We don't want to delete the container, as there's the tmux session running.
#
# dpkg-reconfigure tzdata (or copy)
#
# -e DROPBOX_TOKEN=XYZ
# mosh:
  # 1) boot zsh which loads zshrc
  # 2) set mosh command to docker run ...
FROM ubuntu:18.10

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential zsh wget curl git silversearcher-ag neovim && apt-get autoremove -y

RUN nvim +PlugInstall

ADD * /root/

CMD ["/usr/bin/zsh"]
