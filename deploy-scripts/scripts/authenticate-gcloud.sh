#!/usr/bin/env bash

set xe

GCLOUD_SERVICE_KEY_PATH="$HOME"/gcloud-service-key.json
echo "$GCLOUD_SERVICE_KEY" | base64 --decode --ignore-garbage > "$GCLOUD_SERVICE_KEY_PATH"
gcloud auth activate-service-account --key-file="$GCLOUD_SERVICE_KEY_PATH"
gcloud config set project "$GCLOUD_PROJECT"
gcloud config set compute/zone "$GCLOUD_COMPUTE_ZONE"
gcloud auth configure-docker
gcloud container clusters get-credentials "$GCLOUD_K8_CLUSTER"
