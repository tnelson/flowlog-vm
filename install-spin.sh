sudo apt-get -y install byacc flex

cd
wget http://spinroot.com/spin/Src/spin632.tar.gz
tar xzf spin632.tar.gz
cd Spin/Src6.3.2
make

cd
rm spin632.tar.gz

echo -e "\n# Spin path" >> ~/.profile
echo -e 'PATH="$HOME/Spin/Src6.3.2:$PATH"' >> ~/.profile

source ~/.profile
