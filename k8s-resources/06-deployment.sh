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
pe "kubectl get deployments"

pe "kubectl apply -f ./manifests/rsdemo.yaml --record=true"

pe "kubectl rollout history deployment rs-demo"

pe "kubectl set image deployment.extensions/rs-demo rs-demo=nginx:1.17.8 --record=true"

pe "kubectl rollout history deployment rs-demo"

pe "kubectl rollout undo deployment rs-demo --to-revision=1; watch kubectl get pods"

pe "kubectl rollout history deployment rs-demo"

kubectl delete -f ./manifests/rsdemo.yaml
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
