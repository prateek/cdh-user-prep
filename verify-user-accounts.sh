#!/bin/bash
# User list adapted from
# http://www.cloudera.com/content/cloudera-content/cloudera-docs/CM4Ent/latest/Cloudera-Manager-Installation-Guide/cmig_cm_requirements.html

groups=( cloudscm flume hadoop hbase hdfs hive httpfs hue impala mapred oozie solr spark sqoop sqoop2 yarn zookeeper )

for g in "${groups[@]}"
do
  id -g $g 2>&1 >/dev/null
  [ $? -eq 0 ] && echo "[INFO] Group: $g exists" || echo "[ERROR] Group: $g does not exist"
done

users=( cloudscm flume hbase hdfs hive httpfs hue impala mapred oozie sqoop sqoop2 yarn zookeeper )

function get_user_groups
{
  local user_account=$1
  id "$1" 2>/dev/null         \
   | sed -e 's/^.*groups=//g' \
   | tr ',' '\n'
}

function check_user_group
{
  local user_account=$1
  local group=$2
  rc=$(get_user_groups $user_account | grep $group)
  [ $? -eq 0 ] \
        && echo "[INFO]  User: $user_account belongs to Group: $group"          \
        || echo "[ERROR] User: $user_account does not belong to Group: $group"
}

for u in "${users[@]}"
do
  id $u 2>&1 >/dev/null
  [ $? -eq 0 ] && echo "[INFO] User: $u exists" || echo "[ERROR] User:$u does not exist"

  check_user_group $u $u
done

check_user_group sqoop2 sqoop
check_user_group mapred hadoop
check_user_group hdfs hadoop
check_user_group impala hdfs
check_user_group impala hive
