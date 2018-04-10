xhost +
docker run --rm --name="qgis3.0-desktop" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v ${HOME}/qgis_plugins/plugins:/home/${USER}/.local/share/QGIS/QGIS3/profiles/default/python/plugins  \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	--net=host \
	qgisdev/qgis-desktop:3.0
xhost -
