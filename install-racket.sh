# Add .deb repo for newer versions of racket
echo "deb http://ppa.launchpad.net/plt/racket/ubuntu trusty main" | sudo tee --append /etc/apt/sources.list
echo "deb-src http://ppa.launchpad.net/plt/racket/ubuntu trusty main" | sudo tee --append /etc/apt/sources.list
sudo apt-get update
sudo apt-get -y install racket
# this will be the latest version, though? Need <6 in order to use protobufs library