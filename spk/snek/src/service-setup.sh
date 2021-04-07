SERVICE_COMMAND="npm start"
SVC_BACKGROUND=y
SVC_WRITE_PID=y
SVC_CWD="${SYNOPKG_PKGDEST}"

service_postinst ()
{
	# Install for NodeJS
	cd ${SYNOPKG_PKGDEST}
	npm install &> /dev/null

	# Copy JS file to correct directory for running
	cp ${SYNOPKG_PKGDEST}/node_modules/socket.io-client/dist/socket.io.js ${SYNOPKG_PKGDEST}/node_modules/socket.io-client/

	echo "Installation completed"
}

