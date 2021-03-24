PKG_NAME = terraria-mobile
PKG_VERS = 1.4.1
PKG_EXT = zip
PKG_DIST_NAME = MobileTerrariaServer.zip
PKG_DIST_SITE = https://terraria.org/server
PKG_DIR = terraria

DEPENDS = 

HOMEPAGE = https://terraria.org

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = terraria_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: terraria_install
terraria_install:
	unzip -o $(WORK_DIR)/Linux_MobileServer_1_4_0_5.zip -d $(STAGING_INSTALL_PREFIX)
