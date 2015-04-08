sudo apt-get -y install byacc flex

# newer version:
# http://spinroot.com/spin/Src/spin643.tar.gz

cd
wget http://spinroot.com/spin/Src/spin643.tar.gz
tar xzf spin643.tar.gz
cd Spin/Src6.4.3
make

cd
rm spin643.tar.gz

echo -e "\n# Spin path" >> ~/.profile
echo -e 'PATH="$HOME/Spin/Src6.4.3:$PATH"' >> ~/.profile

source ~/.profile
