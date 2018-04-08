xhost +
# --rm will remove the container as soon as it ends
docker run --rm --name="qgis3.0-desktop" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	qgisdev/qgis-desktop:3.0
xhost -
