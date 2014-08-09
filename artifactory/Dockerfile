FROM codingtony/java

MAINTAINER tony.bussieres@ticksmith.com

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install unzip -y
# this bitly link is the one on the Artifactory Download page http://www.jfrog.com/home/v_artifactory_opensource_download
RUN wget --content-disposition http://bit.ly/Hqv9aj 
#RUN echo "e43771bc8c6a10956495d13300567244  /apache-tomcat-7.0.54.tar.gz" | md5sum -c
RUN cd /opt && unzip ~/artifactory-3.3.0.zip
RUN mv /opt/artifactory-3.3.0 /opt/artifactory
#RUN ln -sf /opt/artifactory-3.3.0 /opt/artifactory
RUN rm ~/artifactory-3.3.0.zip
RUN mkdir /opt/artifactory/data

EXPOSE 8081

CMD [ "/opt/artifactory/bin/artifactory.sh" ]

