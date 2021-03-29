#!/bin/sh

# Package
PACKAGE="debian-chroot"
DNAME="Debian Chroot"

# Others
INSTALL_DIR="/var/packages/${PACKAGE}/target"
CHROOTTARGET="${INSTALL_DIR}/var/chroottarget"
PATH="${INSTALL_DIR}/bin:${INSTALL_DIR}/env/bin:${PYTHON_DIR}/bin:${PATH}"
CHROOT_PATH="/usr/local/bin:/usr/bin:/bin"
TMP_DIR="${SYNOPKG_PKGDEST}/../../@tmp"

preinst ()
{
    exit 0
}

postinst ()
{
    touch ${INSTALL_DIR}/var/installed
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

