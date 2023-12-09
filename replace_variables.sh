#!/bin/bash

NUMBER=01
DOMAIN_NAME=formation.fgtech.fr
PROTOCOLE=https
IP_NODE=10.10.11.110
EXTERNAL_IP_SVC_BACKEND=_EXTERNAL_IP_SVC_BACKEND_


find . -type f -name "*.yaml" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_IP_NODE_/$IP_NODE/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_EXTERNAL_IP_SVC_BACKEND_/$EXTERNAL_IP_SVC_BACKEND/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_DOMAIN_NAME_/$DOMAIN_NAME/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_PROTOCOLE_/$PROTOCOLE/g;"

find 15-rbac -type f -name "*.sh" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"