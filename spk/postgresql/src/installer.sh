#!/bin/sh

# Package
PACKAGE="postgresql"
DNAME="PostegreSQL"

# Others
INSTALL_DIR="/usr/local/${PACKAGE}"
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
  # Link
  ln -s ${SYNOPKG_PKGDEST} ${INSTALL_DIR}

  # create daemon user
  synouser --add ${DAEMON_USER} ${DAEMON_PASS} "${DAEMON_ID}" 0 "" ""

  # determine the daemon user homedir and save that variable in the user's profile
  # this is needed because new users seem to inherit a HOME value of /root which they have no permissions for
  DAEMON_HOME="`cat /etc/passwd | grep "${DAEMON_ID}" | cut -f6 -d':'`"
  su - ${DAEMON_USER} -s /bin/sh -c "echo export HOME=\'${DAEMON_HOME}\' >> .profile"

  # change owner of folder tree
  chown -R ${DAEMON_USER}:users ${SYNOPKG_PKGDEST}

  # Init database
  su - ${DAEMON_USER} -s /bin/sh -c "${SYNOPKG_PKGDEST}/bin/initdb -D ${DATABASE_DIR}"

  # Change default port
  su - ${DAEMON_USER} -s /bin/sh -c "sed -i -e 's/#port = 5432/port=${PG_PORT}/g' ${CFG_FILE}"

  # Change listen addresses
  su - ${DAEMON_USER} -s /bin/sh -c "sed -i -e \"s/#listen_addresses = 'localhost'/listen_addresses = '*'/g\" ${CFG_FILE}"

  # Start server
  su - ${DAEMON_USER} -s /bin/sh -c "${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} -l ${DATABASE_DIR}/logfile start"

  # Update existing role
  su - ${DAEMON_USER} -s /bin/sh -c "${SYNOPKG_PKGDEST}/bin/psql -p ${PG_PORT} -d postgres -c \"ALTER ROLE \\\"${DAEMON_USER}\\\" WITH ENCRYPTED PASSWORD '${PG_PASSWORD}'; \""

  # Create new role
  su - ${DAEMON_USER} -s /bin/sh -c "${SYNOPKG_PKGDEST}/bin/psql -p ${PG_PORT} -d postgres -c \"CREATE ROLE ${PG_USERNAME} ENCRYPTED PASSWORD '${PG_PASSWORD}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN REPLICATION BYPASSRLS; \""

  # Stop server
  su - ${DAEMON_USER} -s /bin/sh -c "${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} stop"

  exit 0
}

preuninst ()
{
  exit 0
}

postuninst ()
{
  # Remove link
  rm -f ${INSTALL_DIR}

  #remove daemon user
  synouser --del ${DAEMON_USER}

  #remove daemon user's home directory (needed since DSM 4.1)
  [ -e /var/services/homes/${DAEMON_USER} ] && rm -r /var/services/homes/${DAEMON_USER}

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
