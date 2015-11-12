# Introduction

Creates a cluster with pods which contains an app and a nginx reverse proxy.

* Push the hello-node image to the project's repo. Run this in the /hello-node directory:
```
export PROJECT_ID=pollablecontent
docker build -t gcr.io/${PROJECT_ID}/hello-node .
gcloud docker push gcr.io/${PROJECT_ID}/hello-node
```
* Push the nginx image to the project's repo. Run this in the /nginx directory:
```
export PROJECT_ID=pollablecontent
```
Edit the nginx.conf file, enable the lines with local host. In Kubernetes pods, containers see each other as localhost.
```
# proxy_pass      http://app:8080;    <--- comment this
proxy_pass      http://localhost:8080;    <--- uncomment this
```
Build the image and push it.
```
docker build -t gcr.io/${PROJECT_ID}/nginx-app .
gcloud docker push gcr.io/${PROJECT_ID}/nginx-app
```

* Run the following
```
export PROJECT="pollablecontent"
export ZONE="us-central1-f"
export CLUSTER_NAME="nodenginxhttps"

gcloud container clusters create ${CLUSTER_NAME} \
  --zone ${ZONE} \
  --machine-type g1-small \
  --num-nodes 2

gcloud config set project ${PROJECT}
gcloud config set compute/zone ${ZONE}
gcloud config set container/cluster ${CLUSTER_NAME}
gcloud container clusters get-credentials ${CLUSTER_NAME}

gcloud config list

kubectl create -f app.yaml
kubectl create -f app-service.yaml
```
