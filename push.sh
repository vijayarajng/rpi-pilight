#!/bin/bash

Kommentar=""

git add .
git commit . -m "Änderung: Löschen PID File vor Start"
git push -u origin master
