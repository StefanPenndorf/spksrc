PKG_NAME = nodered
PKG_VERS = 2.0.3
PKG_EXT = zip
PKG_DIST_NAME = node-red-${PKG_VERS}.${PKG_EXT}
PKG_DIST_SITE = https://github.com/node-red/node-red/releases/download/${PKG_VERS}

DEPENDS =

HOMEPAGE = https://nodered.orgA

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = nodered_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: nodered_install
nodered_install:
	$(RUN) cp -R $(WORK_DIR)/node-red/* $(STAGING_INSTALL_PREFIX)/

