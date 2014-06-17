FROM codingtony/java

MAINTAINER tony.bussieres@ticksmith.com

RUN wget https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/3.5.0/mule-standalone-3.5.0.tar.gz
RUN cd /opt && tar xvzf ~/mule-standalone-3.5.0.tar.gz
RUN ln -s /opt/mule-standalone-3.5.0 /opt/mule 
VOLUME [ "/opt/mule/conf/", "/opt/mule/logs", "/opt/mule/apps", "/opt/mule/domains" ]
CMD [ "/opt/mule/bin/mule" ]
