FROM codingtony/java

MAINTAINER tony.bussieres@ticksmith.com

RUN apt-get update -qq
RUN apt-get upgrade -qqy
RUN apt-get install -qqy unzip curl git mercurial
ENV JENKINS_HOME /opt/jenkins/data
RUN wget --content-disposition http://apache.mirror.nexicom.net/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz
RUN wget --content-disposition http://mirrors.jenkins-ci.org/war-stable/latest/jenkins.war
RUN tar xvzf ~/apache-maven-3.2.3-bin.tar.gz -C /opt
RUN mkdir -p /opt/jenkins/data
RUN mkdir -p /opt/jenkins/data/
RUN mkdir -p /opt/jenkins/plugins
RUN ln -s /opt/jenkins/plugins /opt/jenkins/data/plugins
RUN mv  ~/jenkins.war /opt/jenkins
RUN ln -s /opt/apache-maven-3.2.3 /opt/maven
RUN for plugin in chucknorris greenballs scm-api git-client mercurial artifact-promotion git ws-cleanup ;\
do curl -sf -o /opt/jenkins/plugins/${plugin}.hpi \
-L http://mirrors.jenkins-ci.org/plugins/${plugin}/latest/${plugin}.hpi; done
RUN apt-get install -qqy rpm
RUN ln -s /opt/jenkins/data/m2home /root/.m2


EXPOSE 8080

CMD /usr/bin/java -jar /opt/jenkins/jenkins.war


