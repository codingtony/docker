from centos:6
RUN yum -y update && yum clean all && yum install -y wget 
RUN rpm -Uvh http://hammer:8080/job/jdk/lastSuccessfulBuild/artifact/jdk-1.7.0_65_20141216175534_ticksmith-d645879.x86_64.rpm
RUN rpm -Uvh http://hammer:8080/job/activemq/4/artifact/activemq-5.11.1_20150225112612_ticksmith-ca7287e.x86_64.rpm
RUN yum install -y rpm-build tar git
