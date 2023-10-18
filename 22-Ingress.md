# Ingress

Die Anwendung ist noch nicht von außerhalb des Clusters erreichbar.

```shell
# Ingress anlegen
$ kubectl apply -f k8s-demo-vx-ingress.yaml

# Aufruf der Anwendung von außerhalb über den Hostnamen k8s-demo-vx.internal
$ curl -X GET -w " - > %{response_code}\n" http://k8s-demo-vx.internal/state
```
Im Browser aufrufen http://k8s-demo-vx.internal/state
