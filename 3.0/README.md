docker-qgis-desktop
===================

A simple docker container that runs QGIS 3.0 Girona desktop.

Based on [Tim Sutton](https://github.com/kartoza) and [QGIS-server docker](https://github.com/qgis/QGIS/blob/master/.docker/qgis.dockerfile) work.

Note this is still experimental and probably does not represent
the most optimal way to do this. Current limitations:

* Uses xhost + which is not ideal since it allows all remote
  hosts to display windows on your X display (probably not
  an issue if you are on a local network).


# Getting the image

## Use the docker repository:

This will consume the most bandwidth for the initial build but 
will be easy to update thereafter. 

```
docker pull qgisdev/qgis-desktop:3.0
```


You will also need to create the
desktop shortcut yourself by taking the resources from the git repo e.g.:

```
curl -sL https://github.com/XaviTorello/docker-qgis-desktop/raw/develop/3.0/shortcut_setup.sh | bash
```

or manually coping it:

```
sudo cp run-qgis-3.0-in-docker.sh /usr/local/bin
sudo cp QGIS-3.0.Docker.desktop /usr/share/applications/
sudo cp qgis-icon-60x60.png /usr/local
```

## Start QGIS 3.0 desktop via Docker

Open the "QGIS 3.0 via Docker" through applications menu, or execute:
```
/usr/local/bin/run-qgis-3.0-in-docker.sh
```

Place your plugins at `${HOME}/qgis_plugins/plugins` local folder to "auto-integrate" it on dockerized QGIS.


## Build the image yourself:

Clone the repo to your local system and then run the ``build.sh`` 
script - it will create a launcher script in `/usr/local/bin`
and create a desktop shortcut that will launch QGIS. 

```
git clone git://github.com/XaviTorello/docker-qgis-desktop
cd docker-qgis-desktop
./build.sh
```

##Alternative build:

To build the image do:

```
docker build -t qgisdev/qgis-desktop:3.0 git://github.com/XaviTorello/docker-qgis-desktop
```

If you follow this approach you will need to create the 
application launcher yourself, manually. Consult the sources in this
repository for more details on how to do that.

# Run a container

To run a container do:

```
xhost +
# Users home is mounted as home
# --rm will remove the container as soon as it ends

docker run --rm --name="qgis-desktop-3.0" \
	-i -t \
	-v ${HOME}:/home/${USER} \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=unix$DISPLAY \
	qgisdev/qgis-desktop:3.0 
xhost -
```
The above is the content of run-qgis-3.0-in-docker.sh so you can just
```
./run-qgis-3.0-in-docker.sh
```

Follow the instructions above to create a desktop shortcut. Then, when you
click on the QGIS icon this script will run and start the container. 

Note that your home directory will be mounted in the container and thus
accessible to QGIS. If you want other directories to be available, just add
then to run-qgis-in-docker.sh with -v flags. 

If QGIS crashes or hangs it might leave an orphan docker process running. If
you see the process with 
```
docker ps
```
Then run 
```
docker stop <process id or container name>
```
Else run 
```
docker ps -a
```
then
```
docker rm <process id or container name>
