#!/bin/sh

# Setup encrypted disk image
# For Ubuntu 14.04 LTS

CRYPTFS_ROOT=/cryptfs

apt-get update
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

# Install lastest version of docker engine 
#apt-get -y install docker.io
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates
sudo apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-cache policy docker-engine
sudo apt-get -y install docker-engine

# Start the docker daemon.
sudo service docker stop