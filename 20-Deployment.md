# Deployment

Das Deployment kümmert sich um das Vorhandensein einer definierten Anzahl von Pods (`spec.replicas`).
Die Pods werden über einen ReplicaSet Controller verwaltet.
# TODO Was macht der genau?

```shell

```shell
# Deployment anlegen
$ kubectl apply -f k8s-demo-vx-deploy.yaml
deployment.apps/k8s-demo-vx created

# Deployment anzeigen
$ kubectl get deployments -w
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
k8s-demo-vx   0/1     1            0           17s
k8s-demo-vx   1/1     1            1           21s
# Mit Strg-C beenden
                                                    
# Name des Pods in Umgebungsvariable speichern
$ export POD_NAME="$(kubectl get pods -l app=k8s-demo-vx -o jsonpath='{.items[*].metadata.name}')"

# Befehl im Pod ausführen
$ kubectl exec "$POD_NAME" -- env

# Shell im Pod öffnen
$ kubectl exec -ti $POD_NAME -- bash

# Im Pod (Der Prompt sieht anders aus)
$ ps
$ cat src/server.js
$ curl -X GET -w " - > %{response_code}\n" http://localhost:3000/state

# Shell in Pod beenden
$ exit

$ kubectl get pods -o wide -w
NAME                           READY   STATUS    RESTARTS   AGE     IP           NODE                            NOMINATED NODE   READINESS GATES
k8s-demo-vx-5dccdc4db6-4km5w   1/1     Running   0          4m56s   10.42.0.15   ubuntu-linux-22-04-02-desktop   <none>           <none>

# In anderem Tab
$ export POD_NAME="$(kubectl get pods -l app=k8s-demo-vx -o jsonpath='{.items[*].metadata.name}')"
$ kubectl exec -ti $POD_NAME -- curl -X GET -w " - > %{response_code}\n" http://localhost:3000/error

# Neue Ausgabe von: kubectl get pods -o wide -w
NAME                           READY   STATUS    RESTARTS   AGE     IP           NODE                            NOMINATED NODE   READINESS GATES
k8s-demo-vx-5dccdc4db6-4km5w   1/1     Running   0          4m56s   10.42.0.15   ubuntu-linux-22-04-02-desktop   <none>           <none>
k8s-demo-vx-5dccdc4db6-4km5w   0/1     Error     0          6m45s   10.42.0.15   ubuntu-linux-22-04-02-desktop   <none>           <none>
k8s-demo-vx-5dccdc4db6-4km5w   0/1     Running   1 (2s ago)   6m46s   10.42.0.15   ubuntu-linux-22-04-02-desktop   <none>           <none>
k8s-demo-vx-5dccdc4db6-4km5w   1/1     Running   1 (17s ago)   7m1s    10.42.0.15   ubuntu-linux-22-04-02-desktop   <none>           <none>
```

Der Pod wird im Fehlerfall automatisch neu gestartet.
