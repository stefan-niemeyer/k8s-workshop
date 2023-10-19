# Setup K3s für normalen Benutzer

## K3s installieren

Für die Installation benötigt man `sudo`-Rechte.
```shell
curl -sfL https://get.k3s.io | sudo sh -
```

Im Workshop verwendete Hostnamen auf localhost zeigen lassen.
```shell
sudo nano /etc/hosts
```
Folgende Zeile einfügen
```shell
127.0.0.1 k8s-demo-vx.internal k8s-demo-blue-green.internal k8s-demo-canary.internal
```
## Authentifizierung für normalen Benutzer einrichten

Die Zugangsinformationen für `kubectl` liegen unter `/etc/rancher/k3s/k3s.yaml`. Die Datei kopieren wir in das Home-Verzeichnis des normalen Benutzers und ändern die Rechte.

Mit der Zugangsdatei hat man die vollen Admin-Rechte auf die K3s-Installation.

```shell
$ cd
$ kdir .kube
$ cd .kube
$ sudo cp /etc/rancher/k3s/k3s.yaml config
$ sudo chown $(whoami) config
$ cd
$ nano .bashrc
```
Folgende Zeilen einfügen:
```shell
export KUBECONFIG=$HOME/.kube/config
alias k=kubectl
```

Neuen Tab aufmachen oder `source .bashrc` ausführen.

# K9s Tool
[K9s](https://github.com/derailed/k9s) ist ein Tool für die Kommandozeile, um einen K8s-Cluster zu managen. Man kann die Ressourcen im Cluster leicht anschauen, bearbeiten und löschen.
