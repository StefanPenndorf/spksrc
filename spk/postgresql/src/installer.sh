#!/bin/sh

# Package
PACKAGE="postgresql"
DNAME="PostegreSQL"

# Others
DAEMON_USER="`echo ${SYNOPKG_PKGNAME} | awk {'print tolower($_)'}`"
DAEMON_ID="${SYNOPKG_PKGNAME} daemon user"
DAEMON_PASS="`openssl rand 12 -base64 2>/dev/null`"

DATABASE_DIR="${SYNOPKG_PKGDEST}/share/data"
CFG_FILE="${DATABASE_DIR}/postgresql.conf"
PATH="${SYNOPKG_PKGDEST}:${PATH}"
SERVICE_COMMAND="${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} -l ${DATABASE_DIR}/logfile start"

PG_USERNAME=${wizard_pg_username:=pgadmin}
PG_PASSWORD=${wizard_pg_password:=changepassword}
PG_PORT=${wizard_pg_port:=5433}

preinst ()
{
    exit 0
}

postinst ()
{
  # Init database
  ${SYNOPKG_PKGDEST}/bin/initdb -D ${DATABASE_DIR}

  # Change default port
  sed -i -e "s/#port = 5432/port=${PG_PORT}/g" ${CFG_FILE}

  # Change listen addresses
  sed -i -e "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" ${CFG_FILE}

  # Start server
  ${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} -l ${DATABASE_DIR}/logfile start

  # Create new role
  ${SYNOPKG_PKGDEST}/bin/psql -p ${PG_PORT} -d postgres -c "CREATE ROLE ${PG_USERNAME} ENCRYPTED PASSWORD '${PG_PASSWORD}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN REPLICATION BYPASSRLS; "

  # Stop server
  ${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} stop

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
