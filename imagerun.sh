VERSION=0.0.1
#initialize image from dockerfile
docker build -t covidjhuapi:$VERSION .
#init swarm
docker swarm init
#deploy a service
docker service create --name covidjhuapi \
--replicas 2 \
--update-failure-action rollback \
--update-delay 10s \
--update-monitor 10s \
--publish 8022:8022 \
covidjhuapi:$VERSION

#update image
#docker service update \
#--image covidjhuapi:$VERSION \
#covidjhuapi 