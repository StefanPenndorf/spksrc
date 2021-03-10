#!/bin/sh

# Package
PACKAGE="nextcloud"

# Others
INSTALL_DIR="/var/packages/${PACKAGE}/target"

# New role for embedded PostgreSQL
#PG_USERNAME=${wizard_pg_username:=pgadmin}
#PG_PASSWORD=${wizard_pg_password:=changeme}

preinst ()
{
     exit 0
}

postinst ()
{
     # Embedded PostgreSQL local access
     #echo "host    all             all             127.0.0.1/24            md5" >>/etc/postgresql/pg_hba.conf

     # Embedded PostgreSQL new role to have enough access rights for NextCloud
     #/usr/bin/psql -d postgres -c "CREATE ROLE ${PG_USERNAME} ENCRYPTED PASSWORD '${PG_PASSWORD}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN REPLICATION; "

     exit 0
}

preuninst ()
{
     exit 0
}

postuninst ()
{

     # Drop embedded PostgreSQL new role 
     #/usr/bin/psql -d postgres -c "DROP ROLE ${PG_USERNAME};"

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

