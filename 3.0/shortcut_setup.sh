#!/bin/bash
# Fetch and save the needed files to add a shortcut desired to start the QGIS 3.0 Desktop application!

# Fetch and save Desktop shortcut, icon and QGIS3 docker loader
sudo curl -sLo /usr/share/applications/QGIS-3.0.Docker.desktop https://github.com/XaviTorello/docker-qgis-desktop/raw/develop/3.0/QGIS-3.0.Docker.desktop
sudo curl -sLo /usr/local/qgis3-icon-60x60.png https://github.com/XaviTorello/docker-qgis-desktop/blob/develop/3.0/qgis3-icon-60x60.png
sudo curl -sLo /usr/local/bin/run-qgis-3.0-in-docker.sh https://github.com/XaviTorello/docker-qgis-desktop/raw/develop/3.0/run-qgis-3.0-in-docker.sh

# Grant +x to QGIS3 loader
sudo chmod +x /usr/local/bin/run-qgis-3.0-in-docker.sh
