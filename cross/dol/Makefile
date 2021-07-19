PKG_NAME = dol
PKG_VERS = 1.9.7
PKG_EXT = zip
PKG_DIST_NAME = DOLServer_net45_Release.$(PKG_EXT)
PKG_DIST_SITE = https://github.com/DigitalBox98/DOLSharp/releases/download/1.9.7.001
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/Dawn-of-Light/DOLSharp/wiki
COMMENT  = DOL Server is a server emulator for the game Dark Age of Camelot written by the Dawn of Light community

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = dol_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: dol_install
dol_install:
	echo "eula=true" >$(STAGING_INSTALL_PREFIX)/eula.txt
	cp $(WORK_DIR)/Release/DOLServer.exe $(STAGING_INSTALL_PREFIX)/
	cp $(WORK_DIR)/Release/DOLServer.exe.config $(STAGING_INSTALL_PREFIX)/
	cp $(WORK_DIR)/Release/DOLConfig.exe $(STAGING_INSTALL_PREFIX)/
	cp $(WORK_DIR)/Release/DOLConfig.exe.config $(STAGING_INSTALL_PREFIX)/
	cp -R $(WORK_DIR)/Release/languages $(STAGING_INSTALL_PREFIX)/
	cp -R $(WORK_DIR)/Release/lib $(STAGING_INSTALL_PREFIX)/
	cp -R $(WORK_DIR)/Release/scripts $(STAGING_INSTALL_PREFIX)/

