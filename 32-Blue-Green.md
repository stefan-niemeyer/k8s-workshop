# Blue/Green Deployment

```shell
# Anwendung inder Version 'blue' ausrollen
$ kubectl apply -f k8s-demo-blue.yaml
deployment.apps/k8s-demo-blue created
service/k8s-demo-blue-svc created

# Ingress auf Version 'blue' zeigen lassen
$ kubectl apply -f k8s-demo-blue-ingress.yaml
```

# Anwendung im Browser aufrufen
http://k8s-demo-blue-green.internal

```shell
# Anwendung in der Version 'green' ausrollen
$ kubectl apply -f k8s-demo-green.yaml
deployment.apps/k8s-demo-green created
service/k8s-demo-green-svc created
```

Wechseln zur Version 'green'
```shell
# Anwendung in Schleife aufrufen 
./get-loop.sh blue-green

# In anderem Tab
$ kubectl apply -f k8s-demo-green-ingress.yaml
```
