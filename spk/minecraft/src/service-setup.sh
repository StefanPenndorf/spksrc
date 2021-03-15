SERVICE_COMMAND="java -Xmx1024M -Xms1024M -jar ${SYNOPKG_PKGDEST}/server.jar nogui"
SVC_BACKGROUND=y
SVC_WRITE_PID=y
SVC_CWD=${SYNOPKG_PKGHOME}

# JAR server version 1.16.5 corresponding to Synology Package version :
MOJANG_JAR_LOCATION=https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

WORLD_BACKUP="/tmp/${SYNOPKG_PKGNAME}_world.`date +\"%d-%b\"`.bak"
UPGRADE_FILES="server.properties *.txt world *.json"

service_postinst ()
{
  LATEST_VERSION=`curl -sS https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release'`
  PKGVERSION=$(echo ${SYNOPKG_PKGVER}| cut -d'-' -f 1)

  #if [ ${wizard_new} == "true" ]; then
    # Package version is not matching latest version available on Mojang website
    if [ ${PKGVERSION} != ${LATEST_VERSION} ]; then

      echo "Retrieving newer version ${LATEST_VERSION} from Mojang's website";

      # Get server.jar URL
      URL="`curl -sS https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r --arg VERSION "${LATEST_VERSION}" '.versions | map(select(.id==$VERSION) | .url) | .[0]';`"
      MOJANG_JAR_LOCATION="`curl -sS $URL | jq -r '.downloads.server.url'`"
    fi
  #fi 

  # Retrieve server.jar 
  curl -L -o ${SYNOPKG_PKGDEST}/server.jar ${MOJANG_JAR_LOCATION}

  # Copy eula.txt to user's home
  cp ${SYNOPKG_PKGDEST}/home/eula.txt ${SYNOPKG_PKGHOME}/

  # Copy server.properties as well
  cp ${SYNOPKG_PKGDEST}/home/server.properties ${SYNOPKG_PKGHOME}/

}

service_preuninst ()
{

  if [ ${wizard_keep_data} == "true" ]; then
    #if a world exists, back it up to the tmp folder
    if [ -d ${SYNOPKG_PKGHOME}/world ]; then
      if [ ! -d ${WORLD_BACKUP} ]; then
        mkdir -p ${WORLD_BACKUP}
      fi
      for ITEM in ${UPGRADE_FILES}; do
        cp -r ${SYNOPKG_PKGHOME}/${ITEM} ${WORLD_BACKUP}
      done
      echo "Current world has been saved to ${WORLD_BACKUP}"
    fi
  fi
}

