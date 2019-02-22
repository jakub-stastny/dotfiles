# ISSUES
# I cannot run everything there. For one thing, there's no init.
#       Shall I run init?
#       I can have a top-level tmux, zsh and ruby and in docker neovim ag git etc and make bunch of aliases to these.
#  volumes
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

RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential automake zsh wget curl git silversearcher-ag nodejs neovim && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install yarn
RUN wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz && tar -xzvf ruby-install-0.7.0.tar.gz && cd ruby-install-0.7.0 && make install && cd .. && rm -rf ruby-install-0.7.0 && wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && tar -xzvf chruby-0.3.9.tar.gz && cd chruby-0.3.9 && make install && cd .. && rm -rf chruby-0.3.9
RUN ruby-install ruby -- --disable-install-doc
# TODO: what's missing? gem bundler pry

RUN git clone https://github.com/tmux/tmux.git && cd tmux && sh autogen.sh && ./configure && make && make install && rm -rf tmux
RUN nvim +PlugInstall

ADD * /root/

CMD ["/usr/bin/zsh"]
