# XSB
# Note version: 3.5 (July 6th, 2014)

cd
wget http://xsb.sourceforge.net/downloads/XSB350.tar.gz
tar xzf XSB*
pushd XSB
cd build
./configure
./makexsb
popd
rm XSB*.tar.gz

echo -e "\n# XSB path" >> ~/.profile
echo -e 'PATH="$HOME/XSB/bin:$PATH"' >> ~/.profile

source ~/.profile

