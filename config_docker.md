# Configure Docker Engine 
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
### [/etc/docker/daemon.json](https://docs.docker.com/engine/reference/commandline/dockerd//#daemon-configuration-file)

## [Configure and run Docker on various distributions](https://docs.docker.com/engine/admin/#configuring-docker)

### start docker listening to any ip address on your host, as well as the typical unix socket.
```
sudo docker -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock -d &
$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://SWARM_MANAGER_IP -d
$ docker run -d -p 9000:9000 portainer/portainer -H tcp://SWARM_MANAGER_IP:2375
```

### set docker remote api
  https://docs.docker.com/edge/engine/reference/commandline/dockerd/#daemon-socket-option
```
# listen using the default unix socket, and on 2 specific IP addresses on this host.
$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://192.168.59.106 -H tcp://10.10.10.2
```
