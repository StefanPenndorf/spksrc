
service_postinst ()
{
    cp ${SYNOPKG_PKGDEST}/bin/test.cgi ${SYNOPKG_PKGDEST}/app/

    #${SYNOPKG_PKGDEST}/app/createsqlitedata.py
}
