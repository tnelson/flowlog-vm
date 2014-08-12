
sudo apt-get -y install ocaml-native-compilers
sudo apt-get -y install ctags

# required by opam to install ocamlfind:
sudo apt-get -y install m4

# Will object to ocaml-text?
opam update
opam install -y base-unix base-threads base-bigarray ssl react lablgtk ocaml-text
opam install -y cstruct lwt ocamlfind ocamlgraph ounit pa_ounit quickcheck
opam upgrade

. /home/flowlog/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
# ocaml openflow, packet, frenetic dependencies

cd

git clone git://github.com/adferguson/ocaml-packet.git
cd ocaml-packet
ocaml setup.ml -configure --enable-tests --enable-quickcheck
make && make install
cd

git clone git://github.com/adferguson/ocaml-openflow.git
cd ocaml-openflow
ocaml setup.ml -configure --enable-tests --enable-quickcheck --enable-lwt
make && make install
cd

git clone git://github.com/tnelson/frenetic.git
cd frenetic
make
sudo make install
cd

# param=b tells OCaml to print backtraces on crash
echo -e "\nexport OCAMLRUNPARAM=b\n" >> ~/.bashrc
echo -e '\neval `opam config env`\n' >> ~/.bashrc

# mininet

cd
git clone git://github.com/mininet/mininet.git
sudo ./mininet/util/install.sh -a

# Should be able to do sudo mn --test pingall at this point
