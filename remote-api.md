# [How to Expose the Docker Remote API on Centos 7](https://forums.docker.com/t/expose-the-docker-remote-api-on-centos-7/26022)

dockerd should be added to the standard /usr/bin path on CentOS 7. Check to see that it is there (ls /usr/bin/dockerd) - if it is, make sure your path settings are correct. If it's not, docker hasn't correctly installed and you might want to try again.

Once you get that figured out, the command you list should expose the remote api. In CentOS 7, the init system is systemd, so you might want to create the following folder/file location with the desired docker exec command:

/etc/systemd/system/docker.service.d/docker.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix://var/run/docker.sock

Restart the docker service using systemd commands:

sudo systemctl daemon-reload
sudo systemctl restart docker
You can confirm that the exec took your override parameters by calling:

ps -ef | grep docker
Look for the dockerd process and confirm that your -H settings are listed.

Now, you should be able to hook up to the api: >docker -H :2375 info



eliassalSalam Y. ELIASDec '16
Hi, 
Yes I followed instructions at the url sevral montrhs ago and I had a I think verion 1.2....
I have upgraded to version 1.10.3 4 days ago using

yum upgrade docker
I checked usr/bin, no dockerd file, I have only

docker Program
docker-current Program
docker-storage-setup Program
