FROM jenkins/jenkins:lts
USER root

# Argument passed to use the same host gid docker group
ARG docker_gid

RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get -y install docker-ce

# Copy a list of needed plugins
COPY ./jenkins-plugins.txt /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt

# Change docker gid and add jenkins docker group
RUN groupmod -g $docker_gid docker
RUN usermod -a -G docker jenkins

USER jenkins
