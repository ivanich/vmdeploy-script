#!/bin/bash
 
# choose mirror size
MIRROR="http://us.archive.ubuntu.com/ubuntu"

#MIRROR="http://trane/ubuntu"
 
# choose sute  (precise=12.04)
SUITE=saucy
 
# choose architecture
ARCH="amd64"
#ARCH="i386"
 
VMNAME="node5"
MYOCTET=5
ROOTSIZE=6000
SWAPSIZE=1024
 
# login/password into VM
# we will change the password immediately
ADMIN="vmuser"
INITPWD="vmpass"
 
vmbuilder kvm ubuntu \
--suite="$SUITE" \
--flavour=virtual \
--arch="$ARCH" \
--libvirt=qemu:///system \
--hostname="$VMNAME" \
--bridge=br0 \
--ip="192.168.8.$MYOCTET" \
--mask=255.255.255.240 \
--gw=192.168.8.1 \
--dns=192.168.8.1 \
--domain=localdomain \
--user="$ADMIN" \
--name=Administrator \
--pass="$INITPWD" \
--dest=/var/lib/libvirt/images/$VMNAME  \
--rootsize="$ROOTSIZE" \
--swapsize="$SWAPSIZE" \
--mem=512 \
--addpkg=puppet \
--addpkg linux-image-generic \
--install-mirror="$MIRROR" \
--components main,universe,restricted,multiverse \
--firstboot=/etc/vmbuilder/firstscripts/firstboot.sh \
--debug \
--verbose \
