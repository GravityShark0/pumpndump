#!/bin/sh
# steven hosts
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts >./root/etc/hosts
cat ./root/etc/hosts.template >>./root/etc/hosts
sudo cp ./root/etc/hosts /etc/hosts
