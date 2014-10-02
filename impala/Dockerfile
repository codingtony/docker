FROM codingtony/cdh5-base
MAINTAINER tony.bussieres@ticksmith.com
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install impala impala-server impala-shell hadoop-hdfs-namenode -y
RUN apt-get install hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce -y
RUN apt-get install  impala-catalog impala-state-store


ADD files/core-site.xml /etc/hadoop/conf/
ADD files/hdfs-site.xml /etc/hadoop/conf/

ADD files/core-site.xml /etc/hadoop/conf.impala/
ADD files/hdfs-site.xml /etc/hadoop/conf.impala/
ADD files/start.sh /

RUN /etc/init.d/hadoop-hdfs-namenode init

