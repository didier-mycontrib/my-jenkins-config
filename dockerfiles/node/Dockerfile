FROM jenkins/ssh-agent:6.9.0 as ssh-agent
ARG NODE_MAJOR=22

# ca-certificates because curl uses certificates from ca-certificates
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl gnupg && \
    # Installing nodejs
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install nodejs -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# set /home/jenkins/.npm-global as global npm directory with sufficient access from jenkins user
RUN mkdir /home/jenkins/.npm-global &&\
	chmod 777 /home/jenkins/.npm-global  &&\
    echo 'prefix=~/.npm-global' > /home/jenkins/.npmrc &&\
	echo 'export PATH=/home/jenkins/.npm-global/bin:$PATH' >> /home/jenkins/.profile

# Set SHELL flags for RUN commands to allow -e and pipefail
# Rationale:https://github.com/hadolint/hadolint/wiki/DL4006
SHELL ["/bin/bash", "-eo", "pipefail", "-c"]

RUN echo "PATH=${PATH}" >> /etc/environment && chown -R jenkins:jenkins "${JENKINS_AGENT_HOME}"

#install docker-ce on this agent in order to build and push image from jenkins
RUN install -m 0755 -d /etc/apt/keyrings &&\
	curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc &&\
	chmod a+r /etc/apt/keyrings/docker.asc &&\
	echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null &&\
  apt-get update &&\
  apt-get install -y --no-install-recommends acl docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#gives jenkins user permissions to access /var/run/docker.sock
#via setfacl --modify user:jenkins:rw /var/run/docker.sock
#	npm config set prefix '/home/jenkins/.npm-global'
#	export PATH=/home/jenkins/.npm-global/bin:$PATH
#	in init_jenkins_access.sh
COPY init_jenkins_access.sh init_jenkins_access.sh

# override entrypoint of inherited jenkins/ssh-agent:6.9.0 
# my_entrypoint.sh = call init_jenkijns_access.sh and call setup-sshd
COPY my_entrypoint.sh my_entrypoint.sh
ENTRYPOINT ["sh" ,"my_entrypoint.sh"]