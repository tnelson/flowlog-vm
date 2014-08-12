#!/usr/bin/expect

spawn sudo dpkg-reconfigure wireshark-common -freadline
expect "Should non-superusers be able to capture packets?"
send "yes\r"
expect eof
