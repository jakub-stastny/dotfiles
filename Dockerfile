# alias irb="docker run dotfiles pry"
#
# yarn
# -e DROPBOX_TOKEN=XYZ
# mosh:
  # 1) boot zsh which loads zshrc
  # 2) set mosh command to docker run ...
FROM ubuntu:18.10

RUN apt update && apt upgrade -y && apt install -y build-essential zsh silversearcher-ag nodejs neovim
RUN wget -O ruby-install-0.7.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz && tar -xzvf ruby-install-0.7.0.tar.gz && cd ruby-install-0.7.0 && make install && cd .. && rm -rf ruby-install-0.7.0 && wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && tar -xzvf chruby-0.3.9.tar.gz && cd chruby-0.3.9 && make install && cd .. && rm -rf chruby-0.3.9
RUN ruby-install ruby
# TODO: what's missing? gem bundler pry

RUN git clone https://github.com/tmux/tmux.git && cd tmux && sh autogen.sh && ./configure && make && make install && rm -rf tmux
RUN nvim +PlugInstall

ADD * /root/

CMD ["/usr/bin/zsh"]
