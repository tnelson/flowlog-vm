# Only works until system restart
#sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
#sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1

# changes in sysctl.conf persist
sudo sh -c 'echo "\n#Disable IPv6 to avoid discovery packets in mininet\nnet.ipv6.conf.all.disable_ipv6=1\nnet.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf'
sudo sysctl -p