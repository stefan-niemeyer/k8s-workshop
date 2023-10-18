# Installation und Wartung

## Ausgangssituation
Anwendung läuft auf Server. Sie benötigt ein Betriebssystem, Bibliotheken (z.B. für DB-Zugriff)
und evtl. Laufzeitumgebungen wie Java JRE, Node.JS, Python, ...

## Installation
Die Anwendung muss auf dem Server installiert werden. Dazu müssen Betriebssystem, Bibliotheken und
Laufzeitumgebungen installiert werden. Die Anwendung selbst muss installiert werden.
Die notwendigen Schritte müssen exakt ausgeführt werden oder automatisiert werden, z.B. mit Ansible.

Als Entwickler*in möchte ich die Anwendung auf meinem Rechner installieren können, um sie zu testen.

Bei so vielen Komponenten kann ein Versionsunterschied oder eine Abweichung bei der Installation dazu führen,
dass die Anwendung nicht mehr läuft.

## Wartungsaufgaben
Updates oder Security-Patches des Betriebssystems, der Laufzeitumgebung oder der Anwendung selbst müssen
regelmäßig installiert werden.

Die Updates sollen während des Betriebs installiert werden, ohne dass die Anwendung ausfällt.

## Lösungsbausteine
Images enthalten alle notwendigen Komponenten, um die Anwendung auszuführen. Sie sind unveränderlich, wie ISO-Images.
