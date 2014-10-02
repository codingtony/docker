#!/bin/bash
/etc/init.d/hadoop-hdfs-namenode start
/etc/init.d/hadoop-hdfs-datanode start
/etc/init.d/impala-catalog start
/etc/init.d/impala-state-store start

/bin/bash
