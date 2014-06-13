#!/bin/bash
# User list adapted from
# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Installation-Guide/cmig_cm_requirements.html

groups=( cloudera-scm flume hadoop hbase hdfs hive httpfs hue impala mapred oozie solr spark sqoop sqoop2 yarn zookeeper )

for g in "${groups[@]}"
do
  echo "Group: $g"
  groupadd $g
done

users=( cloudera-scm flume hbase hdfs hive httpfs hue impala mapred oozie sqoop sqoop2 yarn zookeeper )

for u in "${users[@]}"
do
  echo "User: $u"
  useradd -g $u $u
done

usermod -G hdfs impala
usermod -G hive impala
usermod -G sqoop sqoop2
usermod -G hadoop mapred
usermod -G hadoop hdfs
