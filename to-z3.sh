#sudo add-apt-repository ppa:git-core/ppa
#sudo apt-get update
#sudo apt-get upgrade
# gets us to git 2.2.1, but even that won't work.
#git clone https://git01.codeplex.com/z3

#cd ~
#mkdir z3
#cd z3
#git init
#git remote add -f origin https://git01.codeplex.com/z3

# Codeplex doesn't play nicely with git from apt-get. Install from source,
#  with libcurl4-openssl to avoid the Codeplex issue.
sudo apt-get install gettext zlib1g-dev asciidoc libcurl4-openssl-dev
cd ~
git clone https://github.com/git/git.git
cd git
make configure
./configure --prefix=/usr
make all doc
sudo make install install-doc install-html
# get Z3
cd ~
git clone https://git01.codeplex.com/z3
git checkout ml-ng
python scripts/mk_make.py --ml # don't forget the flag, or you will be very confused later on
cd build
make
sudo make install # this installs Z3 into ocamlfind if you used --ml in the script above

# build the examples to generate ml_example
make examples
