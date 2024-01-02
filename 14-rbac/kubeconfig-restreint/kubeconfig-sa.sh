#!/bin/bash

secret_name=list-pod
serviceaccount=dev-sa
namespace=stu_NUMBER_

server=$(kubectl config view -o jsonpath='{.clusters[].cluster.server}')
ca_cert=$(kubectl get secret $secret_name -n $namespace -o jsonpath='{.data.ca\.crt}')
token=$(kubectl get secret $secret_name -n $namespace -o jsonpath='{.data.token}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca_cert}
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