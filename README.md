# playDocker 
# https://hub.docker.com/r/prussia2016/selenium_python_chrome/
1. How to run tests inside container?

   docker run --rm -v <path>:/tests prussia2016/playdocker:jdk8 java -version

2. grant user <user> to access docker

   usermod -a -G docker <user>

3. grant user <user> to access folder /<folder>
   
   sudo chown -R <user>: /<folder>

4. start/stop/delete docker container <container>
   
   docker start/stop/rm/restart <container>

5. do exec in docker container and run shell in it
   
   docker exec -it <container>

6. show all docker process
   
   docker ps
   
   docker ps -all

7. start docker daemon
   
   sudo systemctl start docker
8.
