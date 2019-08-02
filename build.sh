#!/bin/bash

docker build -t derbrummbaer/rpi-pilight:jessie  ./jessie
docker build -t derbrummbaer/rpi-pilight:stretch ./stretch
docker build -t derbrummbaer/rpi-pilight:buster  ./buster
docker build -t derbrummbaer/rpi-pilight:latest  ./latest