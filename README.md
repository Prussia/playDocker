# playDocker 
## [Engine CLI](https://docs.docker.com/engine/reference/commandline/docker/)
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
## [Configure and run Docker on various distributions](https://docs.docker.com/engine/admin/#configuring-docker)
## [(Nexus)Private Registry for Docker](https://books.sonatype.com/nexus-book/3.0/reference/docker.html)
## [Push Docker images on Private Repository](https://books.sonatype.com/nexus-book/3.0/reference/docker.html#docker-push)
## [How to use docker maven plugin(Chinese)](https://www.zybuluo.com/babydragon/note/352069)
### set your private docker registries
Create or modify /etc/docker/daemon.json
{ "insecure-registries":["myregistry.example.com:5000"] }
Restart docker daemon
sudo service docker restart
### Try adding --insecure-registry option to daemon in /etc/systemd/system/docker.service.d/docker.conf file.
[Service]
ExecStart=/usr/bin/dockerd -H fd:// -D --insecure-registry

### start docker listening to any ip address on your host, as well as the typical unix socket.
```
sudo docker -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock -d &
```
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
7. start docker daemon 

   [run Docker on CentOS / Red Hat Enterprise Linux / Fedora](https://docs.docker.com/engine/admin/#centos--red-hat-enterprise-linux--fedora)
   
   [run Docker on Ubuntu](https://docs.docker.com/engine/admin/#ubuntu)
   
   ```
   $ sudo systemctl start docker
   # or on older distributions, you may need to use
   $ sudo service docker start
   ```
8. To update restart policy for one or more containers:

   ```
   $ docker update --restart=on-failure:3 abebf7571666 hopeful_morse
   ```
