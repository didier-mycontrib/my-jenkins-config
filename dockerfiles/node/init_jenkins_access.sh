#after apt-get install -y acl
setfacl --modify user:jenkins:rw /var/run/docker.sock

#after mkdir /home/jenkins/.npm-global and node/npm installation
npm config set prefix '/home/jenkins/.npm-global'
export PATH=/home/jenkins/.npm-global/bin:$PATH