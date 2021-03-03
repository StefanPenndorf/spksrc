PATH="${SYNOPKG_PKGDEST}:${PATH}"
SERVICE_COMMAND="/usr/local/bin/java -Xmx1024M -Xms1024M -jar ${SYNOPKG_PKGDEST}/server.jar nogui"
SVC_BACKGROUND=y
SVC_WRITE_PID=y

service_postinst ()
{
  curl -L -o ${SYNOPKG_PKGDEST}/server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

  # Copy eula.txt to user's home
  cp ${SYNOPKG_PKGDEST}/home/eula.txt ${SYNOPKG_PKGHOME}/

  # Copy server.properties as well
  cp ${SYNOPKG_PKGDEST}/home/server.properties ${SYNOPKG_PKGHOME}/
}

