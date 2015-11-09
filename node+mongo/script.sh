# Set the project name here
export PROJECT="pollablecontent"
export ZONE="us-central1-f"
export CLUSTER_NAME="node-mongo"

gcloud compute disks create \
  --project ${PROJECT} \
  --zone ${ZONE} \
  --size 10GB \
  mongo-disk

gcloud container clusters create ${CLUSTER_NAME} \
  --zone ${ZONE} \
  --machine-type n1-standard-1 \
  --num-nodes 2

kubectl create -f mongodb.yaml
kubectl create -f mongodb-service.yaml
kubectl create -f app.yaml
kubectl create -f app-service.yaml
