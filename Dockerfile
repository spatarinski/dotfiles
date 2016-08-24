FROM ubuntu:16.04
MAINTAINER Stanimir Patarinski
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
EXPOSE 3000 8080
RUN apt-get install -y \
apt-utils \
build-essential \
python2.7 \
nodejs \
zsh \
git \
tmux \
vim


RUN ln -sf /usr/bin/python2.7 /usr/bin/python
COPY tmux.conf /root/.tmux.conf
COPY vimrc /root/.vimrc
COPY zshrc /root/.zshrc
