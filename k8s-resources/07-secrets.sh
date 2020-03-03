#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=50

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear

#Replica Sets
pe "kubectl get secrets"

pe "kubectl create secret generic db-password-secret --from-literal=dbuser=danny --from-literal=dbpassword=noonan_miss_it_noonan"

pe "kubectl get secrets"

pe "kubectl get secret db-password-secret -o yaml"

p "echo DBPassword: \$(kubectl get secret db-password-secret -o jsonpath='{.data.dbpassword}'|base64 --decode)"
echo DBPassword: $(kubectl get secret db-password-secret -o jsonpath='{.data.dbpassword}'|base64 --decode)
PROMPT_TIMEOUT=0
wait
clear
pe "cat ./manifests/secretpod.yaml"
PROMPT_TIMEOUT=0
wait
clear
pe "kubectl apply -f ./manifests/secretpod.yaml"

pe "kubectl exec -it secretpod -- /bin/sh"

p ""

kubectl delete secret db-password-secret
kubectl delete -f ./manifests/secretpod.yaml
# show a prompt so as not to reveal our true nature after
# the demo has concluded
