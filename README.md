vmdeploy-script
===============

Contains scripts and preseed file to deploy ubuntu-13.10


ubuntu-13.10-install.sh installs ubuntu-saucy via virt-install and preseed.conf, it requires internet connection to download ubuntu installer and base system files.It uses static IP configuration.

vmbuildubuntu.sh installs ubuntu-saucy via vmbuilder python script and not using preseed.conf, considering that vmbuilder too buggy piece of software this script won't work without a few hacks in vmbuilder python code.

