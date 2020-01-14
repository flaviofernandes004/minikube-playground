# sso-gateway
This is a playground setup to play around with Keycloak, OAuth2, and proxies (Keycloak-Gatekeeper for now).


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
