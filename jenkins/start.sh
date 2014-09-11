#!/bin/bash
sed 's/ZONE.*="\(.*\)"$/\1/g' /etc/sysconfig/clock > /etc/timezone
/usr/bin/java -jar /opt/jenkins/jenkins.war

