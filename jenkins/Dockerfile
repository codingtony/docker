FROM codingtony/java

MAINTAINER tony.bussieres@ticksmith.com

RUN apt-get update -qq
RUN apt-get upgrade -qqy
RUN apt-get install -qqy unzip curl git mercurial rpm make
ENV JENKINS_HOME /opt/jenkins/data
RUN wget --content-disposition http://apache.mirror.nexicom.net/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
RUN wget --content-disposition http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war
RUN tar xvzf ~/apache-maven-3.2.3-bin.tar.gz -C /opt
RUN mkdir -p /opt/jenkins/data/
RUN mv  ~/jenkins.war /opt/jenkins
RUN ln -s /opt/apache-maven-3.2.3 /opt/maven
RUN ln -s /opt/jenkins/data/m2home /root/.m2
ADD start.sh /opt/jenkins/start.sh


EXPOSE 8080

CMD /opt/jenkins/start.sh


