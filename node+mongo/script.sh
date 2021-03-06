# This script creates a node.js app server talking to a mongo db.
export PROJECT="pollablecontent"
export ZONE="us-central1-f"
export CLUSTER_NAME="nodemongotest"


gcloud compute disks create \
  --project ${PROJECT} \
  --zone ${ZONE} \
  --size 10GB \
  mongo-disk

gcloud container clusters create ${CLUSTER_NAME} \
  --zone ${ZONE} \
  --machine-type n1-standard-1 \
  --num-nodes 2

gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}
gcloud config set container/cluster ${CLUSTER_NAME}
gcloud container clusters get-credentials ${CLUSTER_NAME}

gcloud config list

kubectl create -f mongodb.yaml
kubectl create -f mongodb-service.yaml
kubectl create -f app.yaml
kubectl create -f app-service.yaml
