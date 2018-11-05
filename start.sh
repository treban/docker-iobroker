#!/bin/bash

if [ -f .install_host ];
then
  iobroker host $(cat .install_host) && echo $(hostname) > .install_host
fi

which node

/usr/local/bin/node node_modules/iobroker.js-controller/controller.js

