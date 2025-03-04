Pour bien tout redémarrer:
--------------------------
docker compose --profile python up -d
docker compose --profile node up -d



Pour tout arrêter :
-------------------------------------
docker compose --profile python down 
docker compose --profile node down 

Pour tout arrêter et supprimer les anciennes configurations:
----------------------------------------------------------
docker compose --profile python down -v --remove-orphans
docker compose --profile node down -v --remove-orphans




-----
NB: si besoin de supprimer une image (pour la reconstruire mieux):
docker image rm … (avant docker compose up)
--------------
Rappel : pour debug de container :  docker container exec -ti xyz_container sh
exemple: docker container exec -ti desktop-jenkins_agent-1-node sh
