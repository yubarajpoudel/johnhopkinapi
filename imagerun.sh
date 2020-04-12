#init swarm
docker swarm init

#deploy a service
docker service create --name covidjhuapi \
--replicas 2 \
--update-failure-action rollback \
--update-delay 10s \
--update-monitor 10s \
--publish 8022:8022 \
covidjhuapi:0.0.2

#update image
#docker service update \
#--image covidjhuapi:0.0.2 \
#covidjhuapi 