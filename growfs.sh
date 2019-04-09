#!/bin/bash
#tested on CloudatCost 1804
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk /dev/sda ${TGTDEV}
n # new partition
p # primary partition
# default partition number    
# default - start at beginning of disk
# default, extend partition to end of disk
t # change partition type
# partition to change default
8e # Linux LVM
p # print the in-memory partition table
w # write the partition table
#Next chmod 777 growfs.sh && ./growfs.sh  and reboot
#vgextend ubuntu-vg /dev/sda2 && lvextend -l +100%FREE /dev/mapper/ubuntu--vg-root && resize2fs /dev/mapper/ubuntu--vg-root

EOF
