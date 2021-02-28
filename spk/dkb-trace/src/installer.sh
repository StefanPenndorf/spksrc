#!/bin/sh

# Package
PACKAGE="dkb-trace"

# Others
INSTALL_DIR="/var/packages/${PACKAGE}/target"
INSTALL_WEB_DIR="/var/services/web_packages/${PACKAGE}"

preinst ()
{
    
    exit 0
}

postinst ()
{
    # Edit the configuration according to the wizard
    sed -i -e "s/@username@/${wizard_username:=admin}/g" ${INSTALL_WEB_DIR}/config.php
    sed -i -e "s/@password@/${wizard_password:=admin}/g" ${INSTALL_WEB_DIR}/config.php

    exit 0
}

preuninst ()
{
    exit 0
}

postuninst ()
{
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
