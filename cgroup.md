# cgroup

1. 该cgroup下的进程只在3号cpu上运行，并且这个cpu是独占的
  ```
  docker update --cpuset-cpus="0-2" {contianer name}
  
  docker update --cpuset-cpus="5-7" {contianer name}
  
  docker update --cpuset-cpus="" {contianer name}
  ```

2. Set the flag to a value grater or less than the default of 1024 to increase or reduce the container's weight, and give access to a greeater or lesser proportion of the host machine's CPU cycles. This is only enforced when CPU cycles are constrained. When plenty of CPU cycles are avalable, all containers use as much CPU as they need. 
  ```
  docker update --cpu-shares 1024 {contianer name}

  docker update --cpu-shares 512 {contianer name}
  ```
  
 
3. Specify how much of the avalable CPU resources a container can use.
   ```
   docker update --cpus="5" $(docker ps --format={{.Names}}) 
   ```
4. top rate 500

  ```
  docker update --cpu-quota="500000" $(docker ps --format={{.Names}})
  ```
