# Canary

```shell
# Anwendung inder Version 'canary' ausrollen
$ kubectl apply -f k8s-demo-canary.yaml
deployment.apps/k8s-demo-canary created
service/k8s-demo-canary-svc created

# IngressRoute anlegen mit Aufteilung zwischen Services 80/20
$ kubectl apply -f k8s-demo-canary-ingress-route.yaml

# Anwendung in Schleife aufrufen 
$ ./get-loop.sh canary
```
```json lines
{"host":"k8s-demo-vx-56bc795557-stkt2","method":"GET","path":"/state","version":"v2","totalRequests":234,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-v5rs9","method":"GET","path":"/state","version":"v2","totalRequests":236,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-vfjdv","method":"GET","path":"/state","version":"v2","totalRequests":238,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-4p99r","method":"GET","path":"/state","version":"v2","totalRequests":237,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-canary-5c76669fc-5mx52","method":"GET","path":"/state","version":"canary","totalRequests":30,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-stkt2","method":"GET","path":"/state","version":"v2","totalRequests":235,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-v5rs9","method":"GET","path":"/state","version":"v2","totalRequests":237,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-vfjdv","method":"GET","path":"/state","version":"v2","totalRequests":239,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-4p99r","method":"GET","path":"/state","version":"v2","totalRequests":238,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-canary-5c76669fc-5mx52","method":"GET","path":"/state","version":"canary","totalRequests":31,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-stkt2","method":"GET","path":"/state","version":"v2","totalRequests":236,"readyState":true,"healthState":true} - > 200

```
 Im Browser testen auf der Seite http://k8s-demo-canary.internal/
