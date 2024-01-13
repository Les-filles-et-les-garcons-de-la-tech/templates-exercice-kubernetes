#!/bin/bash

NUMBER=
DOMAIN_NAME=formation.fgtech.fr
PROTOCOLE=https
IP_NODE=_IP_NODE_



find . -type f -name "*.yaml" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_IP_NODE_/$IP_NODE/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_DOMAIN_NAME_/$DOMAIN_NAME/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_PROTOCOLE_/$PROTOCOLE/g;"

find 14-rbac -type f -name "*.sh" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"