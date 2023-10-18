# Setup K3s für normalen Benutzer

```shell
cd
mkdir .kube
cd .kube
sudo cp /etc/rancher/k3s/k3s.yaml config
sudo chown $(whoami) config
cd
nano .bashrc
```
Folgende Zeilen einfügen:
```shell
export KUBECONFIG=$HOME/.kube/config
alias k=kubectl
```

Neuen Tab aufmachen oder `source .bashrc` ausführen.
