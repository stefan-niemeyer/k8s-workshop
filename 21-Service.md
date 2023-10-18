# Service

Der Pod ist von außen noch nicht verfügbar. Zudem ist der Name des Pods nicht stabil.
Wenn der Pod gelöscht wird, bekommt der Neue einen anderen Namen.

```shell
# Pod von außen verfügbar machen

# Services anzeigen lassen
$ kubectl get services
No resources found in workshop namespace.

# Service anlegen
$ kubectl apply -f k8s-demo-vx-service.yaml
service/k8s-demo-vx-svc created

$ kubectl get services
NAME              TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
k8s-demo-vx-svc   ClusterIP   10.43.156.185   <none>        80/TCP    46s

# Alias für Hilfspod erzeugen
$ alias ktools='kubectl run tools --rm -it --image wbitt/network-multitool -- /bin/bash'
$ ktools

# Anwendung innerhalb des Clusters über Service aufrufen
$ curl -X GET -w " - > %{response_code}\n" http://k8s-demo-vx-svc/state
$ for i in {1..120}; do curl -X GET -w " - > %{response_code}\n" http://k8s-demo-vx-svc/state; sleep 1; done

# Pods in anderem Tab löschen
$ kubectl delete pod -l app=k8s-demo-vx

# In dem Hilfspod sieht man einen Wechsel des Hostnamens
# {"host":"k8s-demo-vx-5dccdc4db6-4km5w","method":"GET","path":"/state","version":"v1","totalRequests":26,"readyState":true,"healthState":true} - > 200
# {"host":"k8s-demo-vx-5dccdc4db6-zcv5g","method":"GET","path":"/state","version":"v1","totalRequests":1,"readyState":true,"healthState":true} - > 200
```
