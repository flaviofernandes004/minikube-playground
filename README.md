# Minikube Playground
A playground to play with Identity Providers, OAuth2, metrics, and whatnot.


## Dependencies
- minikube
- ingress addon
- envsubst


## How to run

Execute:
```
minikube start
sh ./apply-config.sh
```

and then update the redirect configuration of each client app through the admin page at `http:/$MINIKUBE_IP/auth`


Note: It's necessary to restore the database with the data dump stored in the folder `/data`
