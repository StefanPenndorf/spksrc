CFG_FILE="${SYNOPKG_PKGDEST}/config/serverconfig.xml"
PATH="${SYNOPKG_PKGDEST}:${PATH}"
SERVICE_COMMAND="mono --debug --gc=sgen --server ${SYNOPKG_PKGDEST}/DOLServer.exe"
SVC_BACKGROUND=y
SVC_WRITE_PID=y


service_postinst ()
{
    # Edit the configuration according to the wizard
    sed -i -e "s/@login@/${wizard_sql_username:=root}/g" ${CFG_FILE}
    sed -i -e "s/@password@/${wizard_sql_password:=changepassword}/g" ${CFG_FILE}
    sed -i -e "s/@port@/${wizard_sql_port:=3306}/g" ${CFG_FILE}
    sed -i -e "s/@ip_address@/${wizard_ip_address}/g" ${CFG_FILE}

    # Create dol database if not exists
    mysql -u ${wizard_sql_username:=root} -p${wizard_sql_password:=changepassword} -P ${wizard_sql_port:=3306} -e 'create database if not exists dol'

    # Fill database with data
    mysql -u ${wizard_sql_username:=root} -p${wizard_sql_password:=changepassword} -P ${wizard_sql_port:=3306} -b dol < ${SYNOPKG_PKGDEST}/config/public-db.sql
}


