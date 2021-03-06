############################################################
# Dockerfile zum erstellen eines Dockercontainers für
# pilight
############################################################

############################################################
# Argument Variables from YAML File
############################################################

FROM derbrummbaer/rpi-raspbian:stretch

# File Author / Maintainer
MAINTAINER Sven Berger

############################################################
############################################################
# USE CROSS-BUILD for Raspberry PI Images
############################################################
############################################################

RUN [ "cross-build-start" ]

############################################################
# don't ask for stupid things
############################################################

ENV DEBIAN_FRONTEND noninteractive
RUN echo APT::Install-Recommends "0"; >> /etc/apt/apt.conf
RUN echo APT::Install-Suggests "0"; >> /etc/apt/apt.conf

############################################################
# Environment Variables
############################################################

############################################################
# User Ändern
############################################################

############################################################
# Upgrade Software: Installed
############################################################

RUN apt-get update && \
	apt-get install wget apt-transport-https wget ca-certificates apt-utils gnupg -qy

############################################################
# Install Software: Pilight
############################################################

# Repository für Pilight
RUN echo "deb http://apt.pilight.org/ stable main" > /etc/apt/sources.list.d/pilight.list && \
	wget -O - https://apt.pilight.org/pilight.key | apt-key add -

RUN apt-get update && \
    apt-get dist-upgrade -qy

RUN apt-get update && \
    apt-get dist-upgrade -qy && \
    apt-get install \
	pilight \
	pilight-webgui \
	-qy
	# pilight=8.1.4 \
	# pilight-webgui=8.4 \

############################################################
# Remove Apt Data
############################################################

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

############################################################
# Copy External Data
############################################################

RUN mkdir /etc/pilight.config && cp -r /etc/pilight/* /etc/pilight.config
COPY config/config.bak /etc/pilight.config/

############################################################
# Copy Start Scripts
############################################################

COPY scripte/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

############################################################
# Folders needed
############################################################

VOLUME ["/etc/pilight", "/var/log"]

############################################################
# Ports needed
############################################################

EXPOSE 5051 5052

############################################################
############################################################
# USE CROSS-BUILD for Raspberry PI Images
############################################################
############################################################

RUN [ "cross-build-end" ]

############################################################
# Container Start
############################################################

CMD 	["/usr/local/bin/run.sh"]
