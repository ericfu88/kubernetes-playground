# Introduction

Builds an nginx image that runs together with an app server so that nginx acts as the reverse proxy to the app.

## HTTP deployment
* Build this image
```
docker build --tag ericfu88/nginx .
```
* Build an app that runs on port 8080
* Run the app on a container, exposing the name of the app as "app".
* You don't need to expose the port 8080 to the host
```
docker run -d --name app ericfu88/hello-node
```
* Run nginx, linking it to the app
```
docker run -d -p 80:80 --name nginx --link app:app ericfu88/nginx
```

## HTTPS

* Create ssl certs
https://cloud.google.com/compute/docs/load-balancing/http/ssl-certificates
* Create the pem file
```
cat private.key cert.crt > cert.pem
```
* Run nginx, linking it to the app, expose port 443
```
docker run -d -p 443:443 --name nginx --link app:app ericfu88/nginx
```
