# playDocker 
## [Engine CLI](https://docs.docker.com/engine/reference/commandline/docker/)
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
## [Configure and run Docker on various distributions](Configure and run Docker on various distributions)
### start docker listening to any ip address on your host, as well as the typical unix socket.
```
sudo docker -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock -d &
```
1. How to run tests inside container?

   ```
   docker run --rm -v <path>:/tests prussia2016/selenium_python_chrome bash -c "export PYTHONPATH=.:/tests/$projectpath/src;pip install -r /tests/$projectpath/resource/req.txt;python /tests/$projectpath/<entry file>"
   ```
2. grant user <user> to access docker

   ```
   usermod -a -G docker <user>
   ```
3. grant user <user> to access folder /<folder>

   ```
   sudo chown -R <user>: /<folder>
   ```
4. start/stop/delete docker container <container>

   ```
   docker start/stop/rm/restart <container>
   ```
5. do exec in docker container and run shell in it

   ```
   docker exec -it <container>
   ```
6. show all docker process

   ```
   $ docker ps
   
   $ docker ps -all
   ```
7. start docker daemon

   ```
   $ sudo systemctl start docker
      # or on older distributions, you may need to use
   $ sudo service docker start
   ```
8. To update restart policy for one or more containers:

   ```
   $ docker update --restart=on-failure:3 abebf7571666 hopeful_morse
   ```
