SERVICE_COMMAND="java -Xmx1024M -Xms1024M -jar ${SYNOPKG_PKGDEST}/server.jar nogui"
SVC_BACKGROUND=y
SVC_WRITE_PID=y
SVC_CWD=${SYNOPKG_PKGHOME}

MOJANG_JAR_LOCATION=https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

WORLD_BACKUP="/tmp/${SYNOPKG_PKGNAME}_world.`date +\"%d-%b\"`.bak"
UPGRADE_FILES="server.properties *.txt world *.json"

service_postinst ()
{
  curl -L -o ${SYNOPKG_PKGDEST}/server.jar ${MOJANG_JAR_LOCATION}

  # Copy eula.txt to user's home
  cp ${SYNOPKG_PKGDEST}/home/eula.txt ${SYNOPKG_PKGHOME}/

  # Copy server.properties as well
  cp ${SYNOPKG_PKGDEST}/home/server.properties ${SYNOPKG_PKGHOME}/
}

service_preuninst ()
{

  echo "service_preuninst ${SYNOPKG_PKG_STATUS}" >> ${SYNOPKG_TEMP_LOGFILE}

  if [ ${wizard_keep_data} == "true" ]; then
    #if a world exists, back it up to the tmp folder
    if [ -d ${SYNOPKG_PKGHOME}/world ]; then
      if [ ! -d ${WORLD_BACKUP} ]; then
        mkdir -p ${WORLD_BACKUP}
      fi
      for ITEM in ${UPGRADE_FILES}; do
        cp -r ${SYNOPKG_PKGHOME}/${ITEM} ${WORLD_BACKUP}
      done
    fi
  fi
}

