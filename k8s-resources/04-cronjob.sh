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

#Daemonset
pe "cat ./manifests/cronjob.yaml"
PROMPT_TIMEOUT=0
wait
clear
pe "kubectl apply -f ./manifests/cronjob.yaml"
pe "kubectl get cronjobs"
pe "kubectl get jobs"
pe "kubectl get pods"
pe "watch kubectl get jobs,pods"
pe "kubectl logs --selector=controller-uid=$(kubectl get jobs -o jsonpath='{.items[0].metadata.labels.controller-uid}')"

kubectl delete -f ./manifests/cronjob.yaml

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
