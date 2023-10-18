# Pod Starten

```shell
# Anwendung starten
$ kubectl run demo --restart=Never --image ghcr.io/stefan-niemeyer/k8s-demo/k8s-demo:v1

# Logs anschauen
$ kubectl logs -f demo

# Anwendung aufrufen
$ kubectl exec -it demo -- curl -X GET -w " - > %{response_code}\n" http://localhost:3000/state

# Anwendung abstürzen lassen
$ kubectl exec -it demo -- curl -X GET -w " - > %{response_code}\n" http://localhost:3000/error

# Pods anzeigen
$ kubectl get pods
NAME   READY   STATUS   RESTARTS   AGE
demo   0/1     Error    0          9m42s

# Pod löschen
$ kubectl delete pod demo
```

## Problem
Nach dem Abstürzen der Anwendung steht sie nicht mehr zur Verfügung.

## Lösungen?
* Was muss getan werden, damit die Anwendung wieder verfügbar ist?
* Wie kann man diese Schritte automatisieren?

