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
pe "kubectl get svc"

pe "cat ./manifests/nginx-svc.yaml"

pe "kubectl apply -f ./manifests/nginx-svc.yaml"
PROMPT_TIMEOUT=0
wait
clear

pe "kubectl get svc"

pe "kubectl run testbox -it --rm --image=busybox --restart=Never -- wget -O- http://$(kubectl get svc nginx-svc -o jsonpath='{.spec.clusterIP}')"
PROMPT_TIMEOUT=0
wait
clear

pe "watch kubectl get svc"

pe "curl $(kubectl get svc nginx-svc -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"

p ""

kubectl delete -f ./manifests/nginx-svc.yaml
# show a prompt so as not to reveal our true nature after
# the demo has concluded
