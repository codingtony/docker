FROM codingtony/java

MAINTAINER tony.bussieres@ticksmith.com

RUN apt-get update
RUN apt-get upgrade -y
RUN wget http://apache.mirror.rafal.ca/tomcat/tomcat-7/v7.0.54/bin/apache-tomcat-7.0.54.tar.gz
RUN echo "e43771bc8c6a10956495d13300567244  /apache-tomcat-7.0.54.tar.gz" | md5sum -c
RUN cd /opt && tar xvf ~/apache-tomcat-7.0.54.tar.gz
RUN ln -sf /opt/apache-tomcat-7.0.54 /opt/tomcat
RUN rm ~/apache-tomcat-7.0.54.tar.gz


VOLUME [ "/opt/tomcat/temp", "/opt/tomcat/webapps", "/opt/tomcat/work", "/opt/tomcat/conf", "/opt/tomcat/logs" ]


EXPOSE 8080

CMD [ "/opt/tomcat/bin/catalina.sh","run" ]

