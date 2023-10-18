# Rolling Update

Es soll eine neue Version ausgerollt werden. Dabei soll die Anwendung weiterhin verfügbar bleiben.

```shell
# Anwendung in Schleife aufrufen 
./get-loop.sh

# In anderem Tab Deployment aktualisieren
$ kubectl set image deployment/k8s-demo-vx backend=ghcr.io/stefan-niemeyer/k8s-demo/k8s-demo:v3
$ kubectl get pods -w
NAME                           READY   STATUS              RESTARTS   AGE
k8s-demo-vx-56bc795557-kdzjw   1/1     Running             0          93s
k8s-demo-vx-84454c4c9d-2q8bh   0/1     ContainerCreating   0          6s
k8s-demo-vx-84454c4c9d-2q8bh   0/1     Running             0          21s
k8s-demo-vx-84454c4c9d-2q8bh   1/1     Running             0          31s
k8s-demo-vx-56bc795557-kdzjw   1/1     Terminating         0          118s
```

Neue Version ist ausgerollt, siehe 'version' in der Antwort. Anzahl Request ist wieder bei 1.
Evtl. stehen kurzfristig die beiden Versionen parallel zur Verfügung.

```json lines
{"host":"k8s-demo-vx-59844756b4-ct29r","method":"GET","path":"/state","version":"v1","totalRequests":67,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-59844756b4-ct29r","method":"GET","path":"/state","version":"v1","totalRequests":68,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-kdzjw","method":"GET","path":"/state","version":"v2","totalRequests":1,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-59844756b4-ct29r","method":"GET","path":"/state","version":"v1","totalRequests":69,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-kdzjw","method":"GET","path":"/state","version":"v2","totalRequests":2,"readyState":true,"healthState":true} - > 200
{"host":"k8s-demo-vx-56bc795557-kdzjw","method":"GET","path":"/state","version":"v2","totalRequests":3,"readyState":true,"healthState":true} - > 200
```

# Skalieren
    
```shell
$ kubectl get deployments -w
$ kubectl scale deployments/k8s-demo-vx --replicas=4
$ kubectl get pods -o wide
NAME                           READY   STATUS    RESTARTS   AGE   IP           NODE                   NOMINATED NODE   READINESS GATES
k8s-demo-vx-84454c4c9d-2q8bh   1/1     Running   0          17m   10.42.0.56   lima-rancher-desktop   <none>           <none>
k8s-demo-vx-84454c4c9d-559b8   1/1     Running   0          87s   10.42.0.57   lima-rancher-desktop   <none>           <none>
k8s-demo-vx-84454c4c9d-vgc8w   1/1     Running   0          87s   10.42.0.59   lima-rancher-desktop   <none>           <none>
k8s-demo-vx-84454c4c9d-94lb8   1/1     Running   0          87s   10.42.0.58   lima-rancher-desktop   <none>           <none>

# Die Pods haben eigene IP-Adressen im Cluster
```

# Ausfallsicherheit testen

```shell
# Anwendung in Schleife aufrufen 
./get-loop.sh

# In anderem Tab Pods löschen
$ curl -X GET -w " - > %{response_code}\n" http://k8s-demo-vx.internal/error
```
