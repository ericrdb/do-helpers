#!/bin/bash
# Per https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04
echo ""
echo "Confirming, no swap yet"
echo ""
swapon -s
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo ""
echo "Should have swap now:"
echo ""
swapon -s
free -m
echo ""
echo "Adjust sysctl settings"
echo ""
echo "/swapfile   none    swap    sw    0   0" | tee -a /etc/fstab
echo "vm.swappiness = 10" | tee -a /etc/sysctl.conf
echo "vm.vfs_cache_pressure = 50" | tee -a /etc/sysctl.conf
tail /etc/sysctl.conf
echo ""
echo "Finished."
echo ""
