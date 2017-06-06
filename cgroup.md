# cgroup

1. docker update --cpuset-cpus="0-1" {contianer name}
  docker update --cpuset-cpus="0-2" {contianer name}
  docker update --cpuset-cpus="5-7" {contianer name}

2. docker update --cpu-shares 1024 {contianer name}

  docker update --cpu-shares 512 {contianer name}
