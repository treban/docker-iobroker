##################################################################
# iobroker docker file
# VERSION               0.1
##################################################################

FROM node:8

LABEL Description="iobroker docker image" Maintainer="trebankosta@gmail.com" Version="0.1"


RUN apt-get update && apt-get -y install git

RUN mkdir -p /opt/iobroker/
WORKDIR /opt/iobroker/
RUN npm install iobroker --unsafe-perm && \
    npm install iobroker.admin && \
    npm install iobroker.vis && \
    npm install iobroker.pimatic && \
    iobroker add vis && \
    iobroker add pimatic && \
    iobroker set admin.0 --enabled --port 9191 && \
    iobroker set web.0 --enabled --port 9192 && \
    iobroker upgrade &&  \
    echo $(hostname) > .install_host

ADD start.sh /opt/iobroker/start.sh
RUN chmod a+x /opt/iobroker/start.sh

VOLUME /opt/iobroker/iobroker-data

EXPOSE 9191 9192
CMD /opt/iobroker/start.sh
