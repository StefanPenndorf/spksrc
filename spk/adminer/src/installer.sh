#!/bin/sh

# Package
PACKAGE="adminer"

# Others
INSTALL_DIR=${SYNOPKG_PKGDEST}/web/
WEB_DIR="/var/services/web"

preinst ()
{
     exit 0
}

postinst ()
{
     # Web directory
     cp -R ${INSTALL_DIR} ${WEB_DIR}/adminer-web/

     exit 0
}

preuninst ()
{
     exit 0
}

postuninst ()
{

     # Web directory
     rm -rf ${WEB_DIR}/adminer-web

     exit 0
}

preupgrade ()
{
     exit 0
}

postupgrade ()
{
     exit 0
}

