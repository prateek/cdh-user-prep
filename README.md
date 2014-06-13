User Accounts for CDH
---------------------

1. `create-user-accounts.sh`: Script to create the required user accounts

```sh
# Usage
# Execute on every node in the cluster
$ ./create-user-accounts.sh
```

2. `verify-user-accounts.sh`: Script to check if the required user accounts exist

```sh
# Sample usage to check errors
# Execute on every node in the cluster
$ ./verify-user-accounts.sh | grep -i error | sort

[ERROR] User: flume does not belong to Group: flume
[ERROR] User: hbase does not belong to Group: hbase
[ERROR] User: hdfs does not belong to Group: hdfs
[ERROR] User: hive does not belong to Group: hive
[ERROR] User: httpfs does not belong to Group: httpfs
[ERROR] User: hue does not belong to Group: hue
[ERROR] User: impala does not belong to Group: hdfs
[ERROR] User: impala does not belong to Group: hive
[ERROR] User: impala does not belong to Group: impala
[ERROR] User: mapred does not belong to Group: mapred
[ERROR] User: oozie does not belong to Group: oozie
[ERROR] User: sqoop2 does not belong to Group: sqoop
[ERROR] User: sqoop2 does not belong to Group: sqoop2
[ERROR] User: sqoop does not belong to Group: sqoop
[ERROR] User: yarn does not belong to Group: yarn
[ERROR] User: zookeeper does not belong to Group: zookeeper
```

