export PROJECT_ID=pollablecontent

docker build -t gcr.io/${PROJECT_ID}/hello-node .

gcloud docker push gcr.io/${PROJECT_ID}/hello-node
