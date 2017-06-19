# Configure Docker Engine 
## [Daemon CLI reference(dockerd)](https://docs.docker.com/engine/reference/commandline/dockerd/)
## [Configure and run Docker on various distributions](https://docs.docker.com/engine/admin/#configuring-docker)

### [Daemon Configuration File](https://docs.docker.com/engine/reference/commandline/dockerd//#daemon-configuration-file)
### [(Nexus)Private Registry for Docker](https://books.sonatype.com/nexus-book/3.0/reference/docker.html)
### [Push Docker images on Private Repository](https://books.sonatype.com/nexus-book/3.0/reference/docker.html#docker-push)
### [How to use docker maven plugin(Chinese)](https://www.zybuluo.com/babydragon/note/352069)

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
