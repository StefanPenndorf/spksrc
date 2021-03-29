#!/bin/sh

# Package
PACKAGE="debian-chroot"
DNAME="Debian Chroot"

# Others
INSTALL_DIR="/var/packages/${PACKAGE}/target"
PATH="${INSTALL_DIR}/bin:${PATH}"
CHROOTTARGET=`realpath ${INSTALL_DIR}/var/chroottarget`


start_daemon ()
{
    return
}

stop_daemon ()
{
    return
}

daemon_status ()
{
    return
}


case $1 in
    start)
        if daemon_status; then
            echo ${DNAME} is already running
            exit 0
        else
            echo Starting ${DNAME} ...
            start_daemon
            exit $?
        fi
        ;;
    stop)
        if daemon_status; then
            echo Stopping ${DNAME} ...
            stop_daemon
            exit 0
        else
            echo ${DNAME} is not running
            exit 0
        fi
        ;;
    status)
        if daemon_status; then
            echo ${DNAME} is running
            exit 0
        else
            echo ${DNAME} is not running
            exit 1
        fi
        ;;
    chroot)
        chroot ${CHROOTTARGET}/ /bin/bash
        ;;
    *)
        exit 1
        ;;
esac
