#!/bin/bash

NUMBER=10
IP_LB_INGR_CONTR=formation.fgtech.fr
PROTOCOLE=https
IP_NODE=10.10.11.110
EXTERNAL_IP_SVC_BACKEND=_EXTERNAL_IP_SVC_BACKEND_

cp -R ../exercices ../exercices-test

find ../exercices-test -type f -name "*.yaml" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"
find ../exercices-test -type f -name "*.yaml" | xargs sed -i  "s/_IP_NODE_/$IP_NODE/g;"
find ../exercices-test -type f -name "*.yaml" | xargs sed -i  "s/_EXTERNAL_IP_SVC_BACKEND_/$EXTERNAL_IP_SVC_BACKEND/g;"
find ../exercices-test -type f -name "*.yaml" | xargs sed -i  "s/_IP_LB_INGR_CONTR_/$IP_LB_INGR_CONTR/g;"
find ../exercices-test -type f -name "*.yaml" | xargs sed -i  "s/_PROTOCOLE_/$PROTOCOLE/g;"

find ../exercices-test/15-rbac -type f -name "*.sh" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"