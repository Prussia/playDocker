# cgroup

1. 该cgroup下的进程只在3号cpu上运行，并且这个cpu是独占的
  ```
  docker update --cpuset-cpus="0-2" {contianer name}
  docker update --cpuset-cpus="5-7" {contianer name}
  ```

2. 
  ```
  docker update --cpu-shares 1024 {contianer name}

  docker update --cpu-shares 512 {contianer name}
  ```
