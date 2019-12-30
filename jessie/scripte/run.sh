#!/bin/bash
# Wenn pidfile nicht gelöscht wurde
if [ -d /var/run/pilight.pid ]; then
	rm /var/run/pilight.pid
fi
# Wenn Config Datei noch nicht exitstiert, -->kopieren
if ! [ "$(ls -A /etc/pilight/config.bak)" ]; then
	cp -a /etc/pilight.config/config /etc/pilight/config.bak
fi

# Kopieren der Konfigurationsdatei
/bin/cp /etc/pilight/config.bak /etc/pilight/config.json
# Starten des Pilight Daemon
/usr/local/sbin/pilight-daemon -F
