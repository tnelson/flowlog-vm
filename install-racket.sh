# Add .deb repo for newer versions of racket
#echo "deb http://ppa.launchpad.net/plt/racket/ubuntu trusty main" | sudo tee --append /etc/apt/sources.list
#echo "deb-src http://ppa.launchpad.net/plt/racket/ubuntu trusty main" | sudo tee --append /etc/apt/sources.list
#sudo apt-get update
#sudo apt-get -y install racket

# Latest version has issues with protobuf library. Instead, use 5.3.6 for IOS processing:

cd
wget http://mirror.racket-lang.org/installers/5.3.6/racket/racket-5.3.6-src-unix.tgz
tar xfz racket-5.3.6-src-unix.tgz
cd racket-5.3.6
cd src
mkdir build
cd build
../configure
make
make install

echo -e "\n# Racket path" >> ~/.profile
echo -e 'PATH="$HOME/racket-5.3.6/bin:$PATH"' >> ~/.profile
source ~/.profile

cd
rm racket-5.3.6-src-unix.tgz

# May need to run this in racket *before* building dependencies for IOS parser (require (planet murphy/protobuf:1:1))
