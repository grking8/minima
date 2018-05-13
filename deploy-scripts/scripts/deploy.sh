#!/usr/bin/env bash

set -xe

apt-get -y install gettext-base
cd deploy-scripts/kubernetes
envsubst < deployment.yml | kubectl apply -f -
envsubst < service.yml | kubectl apply -f -
envsubst < ingress.yml | kubectl apply -f -

