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

#Sidecar
pe "cat ./manifests/sidecar.yaml"
PROMPT_TIMEOUT=0
wait
clear
pe "kubectl apply -f ./manifests/sidecar.yaml"
pe "kubectl get svc,pods"
pe "kubectl describe pod sidecar-demo"
PROMPT_TIMEOUT=0
wait
clear
pe "watch kubectl get svc"
PROMPT_TIMEOUT=0
wait
clear
pe "kubectl exec sidecar-demo --container=logaggregator -- tail -f /var/log/nginx/nginx.errors"
kubectl delete -f ./manifests/sidecar.yaml

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
