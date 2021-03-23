#SERVICE_COMMAND="${SYNOPKG_PKGDEST}/ServerLinux/TerrariaServer.bin.x86_64 -port 7777 -maxplayers 16 -world ${SYNOPKG_PKGHOME}/.local/share/Terraria/Mobile/Worlds/SynoWorld.wld"
SVC_BACKGROUND=n
SVC_WRITE_PID=y
SVC_CWD=${SYNOPKG_PKGHOME}

SERVER_ZIP_LOCATION=https://terraria.org/server/MobileTerrariaServer.zip

service_postinst ()
{
  # Download server
  #curl -L -o ${SYNOPKG_PKGDEST}/MobileTerrariaServer.zip ${SERVER_ZIP_LOCATION}

}

