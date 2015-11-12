# This script creates a node.js app serves https traffic
# Needs two docker images
#  - one for the app, listening on port 8080
#  - one for nginx, routes https traffic to 8080

export PROJECT="pollablecontent"
export ZONE="us-central1-f"
export CLUSTER_NAME="nodemongotest"


gcloud container clusters create ${CLUSTER_NAME} \
  --zone ${ZONE} \
  --machine-type n1-standard-1 \
  --num-nodes 2

gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}
gcloud config set container/cluster ${CLUSTER_NAME}
gcloud container clusters get-credentials ${CLUSTER_NAME}

gcloud config list

kubectl create -f app.yaml
kubectl create -f app-service.yaml
