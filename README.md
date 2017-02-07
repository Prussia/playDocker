# playDocker:elasticsearch
###[扫盲 dm-crypt——多功能 Linux 磁盘加密工具](https://linux.cn/thread-14738-1-1.html)
###[EncryptedFilesystemHowto](https://help.ubuntu.com/community/EncryptedFilesystemHowto3)
###[HowTo: Linux Hard Disk Encryption With LUKS [ cryptsetup Command ]](https://www.cyberciti.biz/hardware/howto-linux-hard-disk-encryption-with-luks-cryptsetup-command/)
	1. Check file system
		a. Create a file on existing non-encrypted filesystem and use that as a block device by a loop device, if it is all one disk. The size depends on the estimation of data amount.
	2. Install packages
		a. $ apt-get -y install cryptsetup
	3. Create Block Device Files
	4. Setup Swap
	5. Setup Encrypted Block Device
	6. Install Docker
	7. Backup the encryption key and the LUKS hearder

###[Runtime privilege and Linux capabilities](https://docs.docker.com/engine/reference/run/#/runtime-privilege-and-linux-capabilities)
```
--privileged=false: Give extended privileges to this container

--device=[]: Allows you to run devices inside the container without the --privileged flag.
```
###docker run --name elasticsearch -d --privileged -p 9200:9200 -p 9300:9300 prussia2016/playdocker:elasticsearch

1. [Runtime privilege and Linux capabilities](https://docs.docker.com/engine/reference/run/#/runtime-privilege-and-linux-capabilities)

2. grant user <user> to access docker

   usermod -a -G docker <user>

3. grant user <user> to access folder /<folder>
   
   sudo chown -R <user>: /<folder>

4. start/stop/delete docker container <container>
   
   docker start/stop/rm/restart <container>

5. do exec in docker container and run shell in it
   
   docker exec -it <container> bash

6. show all docker process
   
   docker ps
   
   docker ps -all

7. start docker daemon
   
   sudo systemctl start docker
