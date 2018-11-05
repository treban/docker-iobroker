## docker-iobroker

### Pull the image

docker pull treban/iobroker

### Run the container

docker run -i -t -P -v /path-to-data-on-host:/opt/iobroker/iobroker-data treban/iobroker

The app folder is /opt/iobroker
The image exposes port 9191 (admin) / 9192 (web)
