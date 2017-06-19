# Configure Docker Engine 
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
### [/etc/docker/daemon.json](https://docs.docker.com/engine/reference/commandline/dockerd//#daemon-configuration-file)

## [Configure and run Docker on various distributions](https://docs.docker.com/engine/admin/#configuring-docker)
### edit daemon in /etc/systemd/system/docker.service.d/docker.conf file. listening to any ip address on your host
```
[Service]
ExecStart=/usr/bin/dockerd -H unix:///var/run/docker.sock -H tcp://SWARM_MANAGER_IP:2375 -d
```

### [set docker remote api](https://docs.docker.com/edge/engine/reference/commandline/dockerd/#daemon-socket-option)
  
  ```
  # listen using the default unix socket, and on 2 specific IP addresses on this host.
  $ sudo dockerd -H unix:///var/run/docker.sock -H tcp://192.168.59.106 -H tcp://10.10.10.2
  ```


1. Configure Docker to start on boot
   ```
   $ sudo systemctl enable docker
   ```
2. start docker daemon 

   [run Docker on CentOS / Red Hat Enterprise Linux / Fedora](https://docs.docker.com/engine/admin/#centos--red-hat-enterprise-linux--fedora)
   
   [run Docker on Ubuntu](https://docs.docker.com/engine/admin/#ubuntu)
   
   ```
   $ sudo systemctl start docker
   # or on older distributions, you may need to use
   $ sudo service docker start
   ```
