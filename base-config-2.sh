# Flowlog
sudo apt-get -y install ocaml
sudo apt-get -y install opam
opam init -y || true
eval `opam config env`
opam update


sudo apt-get -y install camlp4-extra
sudo apt-get -y install default-jdk

###########################################
# Sublime Text
# (Most will use one of: Vim, Emacs, Sublime Text)
# taken from http://www.sublimetext.com/2
sudo apt-get -y install bzip2
cd
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3059_amd64.deb
sudo dpkg -i sublime-text_build-3059_amd64.deb
rm sublime*.deb

