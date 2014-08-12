INSTRUCTIONS FOR CREATING THE FLOWLOG VM
----------------------------------------

Install 64-bit Ubuntu 14.04 LTS. Use all defaults, except no LVM/encryption,
install packages manually, and manual updates. 

VM settings: 1024 MB of memory, 12 GB virtual drive, 1 core at 80%.

Username: flowlog
Password: flowlog

Log into the new VM using flowlog/flowlog.

> sudo apt-get install git
> git clone http://github.com/tnelson/flowlog-vm.git
> cd flowlog-vm
> ./base-config.sh

This will install XFCE, wireshark, Virtualbox's client extensions, and other
needed packages. It may take a while. When prompted, say "yes" to letting
kexec-tools handle reboots. (TODO: expect script to automate that "yes".)

After the script terminates, the VM will reboot. Log in using flowlog (you
should not need to enter a password). Hit ctrl-alt-T to open a terminal, then:

> cd flowlog-vm
> ./remove-unneeded-packages.sh 

This will remove many unnecessary packages, including Ubuntu's
network-manager, which can pop up many annoying messages when running mininet.
Network access should remain intact via eth0. (If access becomes an issue, try
changing the network adapter in VirtualBox's settings to "server" rather than
"desktop".)

Reboot.

You will be prompted to install Ubuntu updates. Let that run.

Now install Flowlog's network dependencies: Mininet, Frenetic, OCaml-Openflow,
etc. Note that Flowlog depends on slightly modified versions of Frenetic and
the OCaml-Openflow stack; it is imperative that the install pull from these
forked repositories.

> cd flowlog-vm
> ./install-frenetic-deps.sh

Test mininet: 
> sudo mn --test pingall

Install XSB and Flowlog:
> ./install-xsb.sh
> ./install-flowlog.sh

To test, open a second tab of the terminal and
> sudo mn --topo=tree,depth=2,fanout=2 --mac --arp --controller=remote
and start Flowlog's MAC learning module in the other:
> cd ~/FlowLog/interpreter
> ./flowlog.native -verbose 2 examples/Mac_Learning.flg

You'll see the switches register after a few seconds ("FINISHED EVENT (9 total...)")

Enter "h1 ping h2" on the mininet prompt. You should see one long-delay ping,
followed by short-delay pings.

Historical note: The previous Flowlog VM, and the mininet demo VM it was based
on, ran on Ubuntu 12.10, which is now past end-of-life. This version also
upgrades XSB from 3.4 to 3.5.


