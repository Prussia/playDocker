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
