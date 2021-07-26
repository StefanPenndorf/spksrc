SERVICE_COMMAND="screen -dmS terraria /bin/bash -c \"${SYNOPKG_PKGDEST}/ServerLinux/TerrariaServer.bin.x86_64 -port 7777 -maxplayers 16 -world ${SYNOPKG_PKGHOME}/.local/share/Terraria/Mobile/Worlds/SynoWorld.wld\""
SVC_BACKGROUND=n
SVC_WRITE_PID=y
SVC_CWD=${SYNOPKG_PKGHOME}

SERVER_ZIP_LOCATION=https://terraria.org/server/MobileTerrariaServer.zip

service_postinst ()
{
  # Download server
  #curl -L -o ${SYNOPKG_PKGDEST}/MobileTerrariaServer.zip ${SERVER_ZIP_LOCATION}

  # Create Worlds folder 
  mkdir ${SYNOPKG_PKGHOME}/.local
  mkdir ${SYNOPKG_PKGHOME}/.local/share
  mkdir ${SYNOPKG_PKGHOME}/.local/share/Terraria
  mkdir ${SYNOPKG_PKGHOME}/.local/share/Terraria/Mobile
  mkdir ${SYNOPKG_PKGHOME}/.local/share/Terraria/Mobile/Worlds/

  # Copy world
  cp ${SYNOPKG_PKGDEST}/SynoWorld.wld ${SYNOPKG_PKGHOME}/.local/share/Terraria/Mobile/Worlds/

}

