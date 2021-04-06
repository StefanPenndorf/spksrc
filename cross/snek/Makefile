PKG_NAME = snek
PKG_VERS = 1.0
PKG_EXT = zip
PKG_DIST_NAME = gh-pages.${PKG_EXT}
PKG_DIST_SITE = https://github.com/flukeout/snek/archive
PKG_DIR = snek-gh-pages

DEPENDS =

HOMEPAGE = https://github.com/flukeout/snek 

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = snek_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: snek_install
snek_install:
	$(RUN) cp -R $(WORK_DIR)/$(PKG_DIR)/* $(STAGING_INSTALL_PREFIX)/

