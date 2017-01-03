#!/bin/sh

CRYPTFS_ROOT=/cryptfs
LOOP_DEVICE=$(losetup -a | grep $CRYPTFS_ROOT | grep -oP "^[^:]*")

service docker.io stop


for DIR_NAME in home var/lib/docker; do
  umount /$DIR_NAME
done

umount /mnt/cryptfs
cryptsetup luksClose cryptfs
losetup -d $LOOP_DEVICE