# Swarm

## [1. Set Up](https://docs.docker.com/engine/swarm/swarm-tutorial/#set-up)

## [2. Open protocols and ports](https://docs.docker.com/engine/swarm/swarm-tutorial/#open-protocols-and-ports-between-the-hosts)
  - TCP port 2377 for cluster management communications
  - TCP and UDP port 7946 for communication among nodes
  - UDP port 4789 for overlay network traffic
  
  ```
  $  firewall-cmd --add-port=2376/tcp --permanent  
  $  firewall-cmd --add-port=2377/tcp --permanent  
  $  firewall-cmd --add-port=7946/tcp --permanent  
  $  firewall-cmd --add-port=7946/udp --permanent  
  $  firewall-cmd --add-port=4789/udp --permanent  
  $  firewall-cmd --reload  
  $  sudo systemctl restart docker  
  $  firewall-cmd --list-all
  ```

### [Manager Node and Worker Node](https://docs.docker.com/engine/swarm/how-swarm-mode-works/nodes/)

### [Create a swarm](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/)
  Run the following command to create a new swarm:
  ```
  docker swarm init --advertise-addr <MANAGER-IP>
  ```
  Sample:
  ```
  $ docker swarm init --advertise-addr 192.168.99.100
    Swarm initialized: current node (dxn1zf6l61qsb1josjja83ngz) is now a manager.

    To add a worker to this swarm, run the following command:

        docker swarm join \
        --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
        192.168.99.100:2377

    To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
  
  ```
  If you don’t have the command available, you can run the following command on a manager node to retrieve the join command for a worker:
  ```
  $ docker swarm join-token worker

    To add a worker to this swarm, run the following command:

      docker swarm join \
      --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
      192.168.99.100:2377
  ```
