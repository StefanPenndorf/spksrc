PKG_NAME = minecraft
PKG_VERS = 1.16.5
PKG_EXT = jar
PKG_DIST_NAME = server.jar
PKG_DIST_SITE = https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced
PKG_DIR = minecraft

DEPENDS =

HOMEPAGE = https://www.minecraft.net

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = minecraft_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: minecraft_install
minecraft_install:
	echo "eula=true" >$(STAGING_INSTALL_PREFIX)/eula.txt
	cp $(WORK_DIR)/../files/server.properties $(STAGING_INSTALL_PREFIX)/server.properties
