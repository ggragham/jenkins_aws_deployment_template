FROM openjdk:11
RUN useradd -m -s /bin/bash jenkins
COPY --chmod=0555 ./jcli /usr/bin/
USER jenkins
RUN mkdir /home/jenkins/jenkins_cli
WORKDIR /home/jenkins/jenkins_cli
COPY --chmod=0555 get_jenkins_cli.sh .
ENTRYPOINT [ "./get_jenkins_cli.sh" ]