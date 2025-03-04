docker stop desktop-jenkins_agent-1-node
docker rm desktop-jenkins_agent-1-node
docker stop my-jenkins-config-jenkins_controller-1
docker rm my-jenkins-config-jenkins_controller-1

#sudo docker compose --profile python down -v --remove-orphans
#docker compose --profile node down -v --remove-orphans
docker compose --profile node down -v 