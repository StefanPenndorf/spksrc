SPK_NAME = minecraft
SPK_VERS = 1.16.5
SPK_REV = 1
SPK_ICON = src/minecraft.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Prepare for an adventure of limitless possibilities as you build, mine, battle mobs, and explore the ever-changing Minecraft landscape.

DISPLAY_NAME = "Minecraft Server"

HOMEPAGE = https://www.minecraft.net

#WIZARDS_DIR = WIZARD_UIFILES

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 25565
STARTABLE = yes

FWPORTS = src/minecraft.sc

# Make sure ARCH is not defined
override ARCH=

POST_STRIP_TARGET = minecraft_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: minecraft_extra_install
minecraft_extra_install:
	# Create required directories
	install -m 755 -d ${STAGING_DIR}/home
	# eula.txt 
	echo "eula=true" > ${STAGING_DIR}/home/eula.txt
	# server.properties
	install -m 644 files/server.properties ${STAGING_DIR}/home/server.properties
