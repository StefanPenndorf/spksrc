PKG_NAME = check
PKG_VERS = 0.14.0
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://github.com/libcheck/check/archive/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = 

HOMEPAGE = https://libcheck.github.io/check/
COMMENT  = Check is a unit testing framework for C
LICENSE  = LGPL

GNU_CONFIGURE = 1

CONFIGURE_TARGET = myConfigure

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) autoreconf --install
	$(RUN) ./configure --disable-build-docs

