PKG_NAME = openexr
PKG_VERS = 2.3.0
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/openexr/openexr/releases/download/v$(PKG_VERS)/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/ilmbase cross/zlib

HOMEPAGE = https://www.openexr.com/
COMMENT  = OpenEXR provides the specification and reference implementation of the EXR file format, the professional-grade image storage format of the motion picture industry. 
LICENSE  = BSD

GNU_CONFIGURE = 1

include ../../mk/spksrc.cross-cc.mk

