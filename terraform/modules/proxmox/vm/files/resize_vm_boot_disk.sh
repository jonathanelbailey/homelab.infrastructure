#! /usr/bin/env bash

disk_type=argv[1]
disk_size=argv[2]
vm_id=argv[3]

upid=`curl -X PUT -sSk \
  -H "Authorization: PVEAPIToken=$PM_API_TOKEN_ID=$PM_API_TOKEN_SECRET" \
  -H "Content-Type: application/json" \
  -d "{ 'disk': '$disk_type', 'size': '$disk_size'}" \
  $PM_API_URL/nodes/$target_node/qemu/$vm_id/resize | jq '.data' | tr -d '"'`

result=`curl -X GET -sSk \
  -H "Authorization: PVEAPIToken=$PM_API_TOKEN_ID=$PM_API_TOKEN_SECRET" \
  -H "Content-Type: application/json" \
  $PM_API_URL/cluster/tasks \
  | jq -r --arg v $upid '.data[] | select(.upid==$v) | .status'`

echo $result

if [[ "$result" =~ "Configuration file 'nodes/.*/qemu-server/.*.conf' does not exist" ]]; then 
    echo "Error: $result"
    exit 1
else
    echo "Success: $result"
    exit 0
fi