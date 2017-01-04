#!/bin/sh

CRYPTFS_ROOT=/cryptfs
LOOP_DEVICE=$(losetup -f)

losetup $LOOP_DEVICE $CRYPTFS_ROOT/disk
cryptsetup luksOpen $LOOP_DEVICE cryptfs

mkdir -p /mnt/cryptfs

mount /dev/mapper/cryptfs /mnt/cryptfs


# Setup bind mounts for Docker

for DIR_NAME in home var/lib/docker
do
  mkdir -p "/mnt/cryptfs/${DIR_NAME}"
  mkdir -p "/$DIR_NAME"
  mount --bind /mnt/cryptfs/${DIR_NAME} /$DIR_NAME 
done

# Start the docker daemon.
sudo service docker start
