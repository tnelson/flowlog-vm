#!/bin/bash

# get the source
cd
wget https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2
bunzip2 protobuf-2.5.0.tar.bz2
tar xf protobuf-2.5.0.tar

# build the c++ code
cd protobuf-2.5.0
./configure
make
make check
sudo make install

# install the python libraries
cd python
python setup.py build
python setup.py test
python setup.py install


cd
rm protobuf-2.5.0.tar
