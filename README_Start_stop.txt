Pour bien tout redémarrer:
--------------------------
docker compose --profile python up -d
docker compose --profile node up -d
docker compose --profile maven up -d
docker compose --profile node --profile maven up -d



Pour tout arrêter :
-------------------------------------
docker stop desktop-jenkins_agent-1-node
docker rm desktop-jenkins_agent-1-node
docker stop desktop-jenkins_agent-1-maven
docker rm desktop-jenkins_agent-1-maven
docker stop my-jenkins-config-jenkins_controller-1
docker rm my-jenkins-config-jenkins_controller-1
docker compose --profile python down 
docker compose --profile node down 
docker compose --profile maven down 
...

Pour tout arrêter et supprimer les anciennes configurations:
----------------------------------------------------------
docker stop desktop-jenkins_agent-1-node
docker rm desktop-jenkins_agent-1-node
docker stop desktop-jenkins_agent-1-maven
docker rm desktop-jenkins_agent-1-maven
docker stop my-jenkins-config-jenkins_controller-1
docker rm my-jenkins-config-jenkins_controller-1
docker compose --profile python down -v --remove-orphans
docker compose --profile node down -v --remove-orphans
docker compose --profile maven down -v --remove-orphans
...


-----
NB: si besoin de supprimer une image (pour la reconstruire mieux):
docker image rm … (avant docker compose up)
--------------
Rappel : pour debug de container :  docker container exec -ti xyz_container sh
exemple: docker container exec -ti desktop-jenkins_agent-1-node sh
