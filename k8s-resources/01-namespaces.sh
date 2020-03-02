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

#Namespaces
pe "kubectl get ns"

pe "kubectl create ns dev"

pe "kubectl apply -f ./manifests/quota.yaml"

pe "kubectl describe ns dev"

# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
