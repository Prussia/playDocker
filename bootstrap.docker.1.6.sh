#!/bin/sh

# Setup encrypted disk image
# For Ubuntu 14.04 LTS

CRYPTFS_ROOT=/cryptfs

apt-get update
apt-get -y upgrade
apt-get -y install cryptsetup

mkdir -p $CRYPTFS_ROOT
dd if=/dev/zero of=$CRYPTFS_ROOT/swap bs=1M count=2048
truncate -s 20G $CRYPTFS_ROOT/disk
chmod -R 700 "$CRYPTFS_ROOT"

LOOP_DEVICE=$(losetup -f)
losetup $LOOP_DEVICE $CRYPTFS_ROOT/disk
badblocks -s -w -t random -v $LOOP_DEVICE
cryptsetup -y luksFormat $LOOP_DEVICE
cryptsetup luksOpen $LOOP_DEVICE cryptfs
mkfs.ext4 /dev/mapper/cryptfs
mkdir -p /mnt/cryptfs
mount /dev/mapper/cryptfs /mnt/cryptfs


# Setup bind mounts for Docker

for DIR_NAME in home var/lib/docker
do
  mkdir -p "/mnt/cryptfs/${DIR_NAME}"
  mkdir -p "/$DIR_NAME"
  mount --bind /mnt/cryptfs/${DIR_NAME} /$DIR_NAME 
done

apt-get -y install docker.io
ln -sf /usr/bin/docker.io /usr/local/bin/docker

update-rc.d -n docker.io stop 70 0 1 2 3 4 5 6 .