CFG_FILE="${SYNOPKG_PKGDEST}/var/wesnoth.cfg"
SERVICE_COMMAND="${SYNOPKG_PKGDEST}/usr/local/bin/wesnothd -p 15001 -c ${CFG_FILE}"
SVC_CWD="${SYNOPKG_PKGHOME}"
SVC_BACKGROUND=y
SVC_WRITE_PID=y


service_postinst ()
{
    # Edit the configuration according to the wizard
    sed -i -e "s/@password@/${wizard_wn_password:=changeme}/g" ${CFG_FILE}
}

