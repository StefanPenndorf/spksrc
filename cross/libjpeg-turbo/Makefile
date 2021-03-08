PKG_NAME = libjpeg-turbo
PKG_VERS = 1.5.3
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://libjpeg-turbo.org/
COMMENT  = JPEG turbo library
LICENSE  =

GNU_CONFIGURE = 1

CONFIGURE_TARGET = libjpeg_configure

include ../../mk/spksrc.cross-cc.mk

.PHONY: libjpeg_configure
libjpeg_configure: 
	 cd $(WORK_DIR)/$(PKG_DIR) ; autoreconf -fiv
	 cd $(WORK_DIR)/$(PKG_DIR) ; ./configure
