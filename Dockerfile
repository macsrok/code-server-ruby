FROM linuxserver/code-server:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install gpg software-properties-common -qq
RUN apt-add-repository -y ppa:rael-gc/rvm
RUN apt-get update
RUN apt-get install rvm -qq
SHELL [ "/bin/bash", "-l", "-c" ]
RUN source /usr/share/rvm/scripts/rvm
RUN rvm install ruby-2.6.5
RUN gem install bundler
RUN mkdir -p /gems/rubocop
RUN gem install --install-dir /gems/rubocop rubocop
