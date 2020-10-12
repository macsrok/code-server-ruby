FROM linuxserver/code-server:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -qq -y && apt install openssh-server -qq -y
RUN chmod -R 777 /config
RUN mkdir /home/abc && chown abc:abc /home/abc && chmod 700 /home/abc && usermod --home /home/abc abc
RUN apt install -qq -y gawk g++ gcc autoconf automake bison libc6-dev libffi-dev libgdbm-dev libncurses5-dev libsqlite3-dev libtool libyaml-dev make pkg-config sqlite3 zlib1g-dev libgmp-dev libreadline-dev libssl-dev 
USER abc
RUN curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
RUN curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN ["/bin/bash", "-c", "curl -sSL https://get.rvm.io | bash -s stable --ruby #> /dev/null 2>&1-9"]
RUN ["/bin/bash", "-c", "source ~/.rvm/scripts/rvm && ruby --version"]
RUN ["/bin/bash", "-c", "source ~/.rvm/scripts/rvm && gem install bundler && gem install rubocop && gem install solargraph"]