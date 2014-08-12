
cd

opam install -y extlib thrift yojson oasis

sudo apt-get -y install protobuf-compiler

git clone git://github.com/tnelson/FlowLog.git
cd FlowLog/interpreter
make
cd


