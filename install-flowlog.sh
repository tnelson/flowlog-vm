
cd

sudo apt-get -y install thrift-compiler

opam install -y extlib thrift yojson oasis

sudo apt-get -y install protobuf-compiler

# thrift for python
sudo apt-get -y install python-pip
sudo pip install thrift
sudo pip install netaddr

git clone git://github.com/tnelson/FlowLog.git
cd FlowLog/interpreter
make
cd


