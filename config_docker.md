# Configure Docker Engine 

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
$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://SWARM_MANAGER_IP -d
$ docker run -d -p 9000:9000 portainer/portainer -H tcp://SWARM_MANAGER_IP:2375
```

### set docker remote api
  https://docs.docker.com/edge/engine/reference/commandline/dockerd/#daemon-socket-option
```
# listen using the default unix socket, and on 2 specific IP addresses on this host.
$ sudo dockerd -H unix:///var/run/docker.sock -H tcp://192.168.59.106 -H tcp://10.10.10.2
```
