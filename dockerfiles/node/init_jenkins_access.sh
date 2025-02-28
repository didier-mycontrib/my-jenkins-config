#after apt-get install -y acl
setfacl --modify user:jenkins:rw /var/run/docker.sock

#source .profile
#NB: . /home/jenkins/.profile should be invoke from jenkins user