# playDocker 
# https://www.cyberciti.biz/hardware/howto-linux-hard-disk-encryption-with-luks-cryptsetup-command/
# https://docs.docker.com/engine/reference/run/#/runtime-privilege-and-linux-capabilities
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
