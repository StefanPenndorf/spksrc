PKG_NAME = taglib
PKG_VERS = 1.11.1
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://github.com/taglib/taglib/archive/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = 

HOMEPAGE = https://taglib.org
COMMENT  = TagLib is a library for reading and editing the meta-data of several popular audio formats. 
LICENSE  = LGPL

GNU_CONFIGURE = 1

CONFIGURE_TARGET = myConfigure

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake -DCMAKE_INSTALL_PREFIX=$(INSTALL_PREFIX) -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON .

