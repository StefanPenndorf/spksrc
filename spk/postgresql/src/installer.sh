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

PG_BACKUP=${wizard_pg_dump_directory}
PG_BACKUP_CONF_DIR="${PG_BACKUP}/conf_`date +\"%d_%b\"`"
PG_BACKUP_DUMP_DIR="${PG_BACKUP}/databases_`date +\"%d_%b\"`"
PG_BACKUP_DUMP_FILE_SUFFIX=".dump"

INST_ETC="/var/packages/${SYNOPKG_PKGNAME}/etc"
INST_VARIABLES="${INST_ETC}/installer-variables"

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

  echo "SAVE_PG_USERNAME=${wizard_pg_username}" > ${INST_VARIABLES}
  echo "SAVE_PG_PASSWORD=${wizard_pg_password}" >> ${INST_VARIABLES}
  echo "SAVE_PG_PORT=${wizard_pg_port}" >> ${INST_VARIABLES}

  exit 0
}

preuninst ()
{

  # Backup only on user's request
  if [ "$wizard_pg_dump_database" = "true" ]; then

    # Start server again
    ${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} -l ${DATABASE_DIR}/logfile start

    # Create backup conf dir
    if [ ! -d ${PG_BACKUP_CONF_DIR} ]; then
      mkdir -p ${PG_BACKUP_CONF_DIR}
      chmod 755 ${PG_BACKUP_CONF_DIR}
    fi

    # Backup config files
    cp ${DATABASE_DIR}/pg_hba.conf ${PG_BACKUP_CONF_DIR}/
    cp ${DATABASE_DIR}/pg_ident.conf ${PG_BACKUP_CONF_DIR}/
    cp ${DATABASE_DIR}/postgresql.auto.conf ${PG_BACKUP_CONF_DIR}/
    cp ${DATABASE_DIR}/postgresql.conf ${PG_BACKUP_CONF_DIR}/

    # Create backup dump dir
    if [ ! -d ${PG_BACKUP_DUMP_DIR} ]; then
      mkdir -p ${PG_BACKUP_DUMP_DIR}
      chmod 777 ${PG_BACKUP_DUMP_DIR}
    fi

    # Backup all databases before uninstalling
    for database in `${SYNOPKG_PKGDEST}/bin/psql -A -t -p ${PG_PORT} -U ${PG_USERNAME} -d postgres -c "select datname from pg_database"`;
    do
            # Dumping each database
            ${SYNOPKG_PKGDEST}/bin/pg_dump -p ${PG_PORT} -U ${PG_USERNAME} -Fc ${database} >${PG_BACKUP_DUMP_DIR}/${database}${PG_BACKUP_DUMP_FILE_SUFFIX}
    done

    # Stop server
    ${SYNOPKG_PKGDEST}/bin/pg_ctl -D ${DATABASE_DIR} stop
  fi

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
