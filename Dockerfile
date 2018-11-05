##################################################################
# iobroker docker file
# VERSION               0.1
##################################################################

FROM node:6

LABEL Description="iobroker docker image" Maintainer="trebankosta@gmail.com" Version="0.1"


RUN apt-get update && apt-get -y install git

RUN mkdir -p /opt/iobroker/
WORKDIR /opt/iobroker/
RUN npm install iobroker --unsafe-perm
RUN npm install iobroker.admin
RUN npm install iobroker.vis
RUN npm install iobroker.pimatic
RUN iobroker add vis
RUN iobroker add pimatic
RUN iobroker set admin.0 --enabled --port 9191
RUN iobroker set web.0 --enabled --port 9192
VOLUME /opt/iobroker/

EXPOSE 9191 9192
CMD /usr/local/bin/node node_modules/iobroker.js-controller/controller.js
