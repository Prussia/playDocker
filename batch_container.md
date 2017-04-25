# batch manipulation 

## start_exited_containers
docker start $(docker ps -a -q -f status=exited)

## restart_running_containers
docker restart $(docker ps -a -q -f status=running)

## stop_running_containers
docker stop $(docker ps -a -q -f status=running)
