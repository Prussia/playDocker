# playDocker 
## [Engine CLI](https://docs.docker.com/engine/reference/commandline/docker/)

### Event and State
<p align="center">
  <img src="./event_state.png" width="950"/>
</p>

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
   docker exec -it <container> bash
   ```
6. show all docker process

   ```
   $ docker ps
   
   $ docker ps -all
   ```
7. To update restart policy for one or more containers:

   ```
   $ docker update --restart=on-failure:3 abebf7571666 hopeful_morse
   ```
8. present container name with status
   ```
   $ docker stats $(docker ps --format={{.Names}})
   ```
 
