#!/bin/bash
# Fetch and save the needed files to add a shortcut desired to start the QGIS 3.0 Desktop application!

sudo curl -sLo /usr/share/applications/QGIS-3.0.Docker.desktop https://github.com/XaviTorello/docker-qgis-desktop/raw/add_release_3.0/3.0/QGIS-3.0.Docker.desktop
sudo curl -sLo /usr/local/qgis-icon-60x60.png https://github.com/XaviTorello/docker-qgis-desktop/blob/add_release_3.0/3.0/qgis-icon-60x60.png
sudo curl -sLo /usr/local/bin/run-qgis-3.0-in-docker.sh https://github.com/XaviTorello/docker-qgis-desktop/raw/add_release_3.0/3.0/run-qgis-3.0-in-docker.sh
