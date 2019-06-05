#!/bin/bash

TARBALL=globusconnectpersonal-latest.tgz
GLOBUS_VERSION=$(tar ztvf $TARBALL | head -1 | cut -d" " -f 10 | cut -d- -f2 | cut -d/ -f1)

## install Globus Personal Connect
VERSION=$GLOBUS_VERSION
wget --directory-prefix=/usr/local https://s3.amazonaws.com/connect.globusonline.org/linux/stable/$TARBALL
(cd /usr/local && tar zxvf $TARBALL)
(cd /usr/local/bin && ln -s ../globusconnectpersonal-$VERSION/globusconnect)
