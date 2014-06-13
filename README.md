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
# Usage
# Execute on every node in the cluster
$ ./verify-user-accounts.sh | grep -i error | sort
```
