#!/bin/bash
NAME=node3.local
RAM=1024
DISK_SIZE=5
HOSTNAME=node3
IP_ADDR="192.168.8.12"
NETMASK="255.255.255.240"
GATEWAY="192.168.8.1"
NAMESERVER="192.168.8.1"


virt-install \
--os-type=linux \
--os-variant=ubuntusaucy \
--connect qemu:///system \
--name=$NAME \
--ram $RAM \
--disk pool=default,size=$DISK_SIZE,bus=virtio,sparse=false \
--network=bridge:br0,model=virtio \
--location=http://ua.archive.ubuntu.com/ubuntu/dists/saucy/main/installer-amd64/ \
--initrd-inject=/root/preseed.cfg \
--extra-args="locale=en_US.UTF-8 console-setup/ask_detect=false keyboard-configuration/layoutcode=us file=file:/preseed.cfg vga=788 quiet interface=eth0 hostname=$HOSTNAME domain=local netcfg/get_ipaddress=$IP_ADDR netcfg/get_netmask=$NETMASK netcfg/get_gateway=$GATEWAY netcfg/get_nameservers=$NAMESERVER netcfg/disable_dhcp=true" \
--virt-type kvm \
--video=vga \
--vnc 
#--debug 
#--noreboot

