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
pe "kubectl get rs"

pe "cat ./manifests/rsdemo.yaml"

pe "kubectl apply -f ./manifests/rsdemo.yaml"

pe "kubectl get rs"

pe "kubectl get pods"

kubectl delete -f ./manifests/rsdemo.yaml
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
