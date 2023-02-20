#!/bin/bash

NUMBER=01
IP_NODE=10.10.11.110
IP_LB_INGR_CONTR=formation.waxconf2021.fr

find . -type f -name "*.yaml" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_IP_NODE_/$IP_NODE/g;"
find . -type f -name "*.yaml" | xargs sed -i  "s/_IP_LB_INGR_CONTR_/$IP_LB_INGR_CONTR/g;"

find 15-rbac -type f -name "*.sh" | xargs sed -i  "s/_NUMBER_/$NUMBER/g;"