#after apt-get install -y acl
setfacl --modify user:jenkins:rw /var/run/docker.sock

#source .profile
. /home/jenkins/.profile