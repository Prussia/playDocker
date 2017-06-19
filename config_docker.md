# Configure Docker Engine 
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
### [Daemon Configuration File](https://docs.docker.com/engine/reference/commandline/dockerd//#daemon-configuration-file)

## [Configure and run Docker on various distributions](https://docs.docker.com/engine/admin/#configuring-docker)

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
