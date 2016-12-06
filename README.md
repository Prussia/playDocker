# elasticsearch 1.7.6

# to configure the shield in elasticsearch.yml

shield:  
  authc:
    realms:
      default:
        type: esusers
        order: 0
        enabled: true
        files:
          users: "/etc/elasticsearch/shield/users"
          users_roles: "/etc/elasticsearch/shield/users_roles" 
           
1. 
2. grant user <user> to access docker

   usermod -a -G docker <user>

3. grant user <user> to access folder /<folder>
   
   sudo chown -R <user>: /<folder>

4. start/stop/delete docker container <container>
   
   docker start/stop/rm/restart <container>

5. do exec in docker container and run shell in it
   
   docker exec -it <container>

6. show all docker process
   
   docker ps
   
   docker ps -all

7. start docker daemon
   
   sudo systemctl start docker
