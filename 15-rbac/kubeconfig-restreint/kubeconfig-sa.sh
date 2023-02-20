#!/bin/bash

# Adresse du server
# server=https://0.0.0.0:34243

# cluster_name=k3d-k3s-default
serviceaccount=dev-sa
namespace=stu_NUMBER_

server=$(kubectl config view -o jsonpath='{.clusters[].cluster.server}')
# server=$(kubectl config view -o jsonpath='{.clusters[?(@.name=='$cluster_name')].cluster.server}')
secret=$(kubectl get serviceaccount $serviceaccount  -n $namespace -o jsonpath={.secrets[0].name})
ca=$(kubectl get secret $secret -n $namespace -o jsonpath='{.data.ca\.crt}')
token=$(kubectl get secret $secret -o jsonpath='{.data.token}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: default-cluster
    namespace: ${namespace}
    user: system:serviceaccount:${namespace}:${serviceaccount}
current-context: default-context
users:
- name: system:serviceaccount:${namespace}:${serviceaccount}
  user:
    token: ${token}
" > $serviceaccount.kubeconfig


echo "**************"
echo "Fichier créé : $PWD/$serviceaccount.kubeconfig "
echo "**************"
cat $PWD/$serviceaccount.kubeconfig
echo "**************"
echo -e "Pour utiliser ce contexte, lancer : \nexport KUBECONFIG=$PWD/$serviceaccount.kubeconfig"