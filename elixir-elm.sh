#!/bin/bash

##############################################################
## THIS INSTALLS THE DEVELOPMENT PLATOFRM FOR ELIXIR ELM STACK
##############################################################
##############################################################

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo 'deb https://packages.erlang-solutions.com/debian xenial contrib' | sudo tee -a  /etc/apt/sources.list
wget -qO - https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | sudo apt-key add -


sudo apt update
sudo apt install -y build-essential
sudo apt install -y inotify-tools
sudo apt install -y nodejs-legacy
sudo apt install -y esl-erlang elixir

echo fs.inotify.max_user_watches=16384 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p

sudo mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

sudo chown ubuntu -R /home/ubuntu/
mix local.rebar --force
mix local.hex --force

wget "https://github.com/elm/compiler/releases/download/0.19.0/binaries-for-linux.tar.gz"
tar xzf binaries-for-linux.tar.gz
sudo mv elm /usr/local/bin/

npm install natives
