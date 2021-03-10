PKG_NAME = curaengine
PKG_VERS = 4.8.0
PKG_EXT = tar.gz
PKG_DIST_SITE = https://github.com/Ultimaker/CuraEngine/archive
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = CuraEngine-$(PKG_VERS)

DEPENDS = 

HOMEPAGE = https://ultimaker.com
COMMENT  = CuraEngine is a powerful, fast and robust engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers.
LICENSE  = AGPLv3

CONFIGURE_TARGET = myConfigure
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) cmake -DENABLE_ARCUS=OFF .
#	-DArcus_DIR=$(STAGING_INSTALL_PREFIX)/../lib -DCMAKE_PREFIX_PATH=$(STAGING_INSTALL_PREFIX)/../ -DProtobuf_LIBRARY=$(STAGING_INSTALL_PREFIX) -DProtobuf_DIR=$(STAGING_INSTALL_PREFIX) -DProtobuf_INCLUDE_DIR=$(STAGING_INSTALL_PREFIX)/include .

.PHONY: myInstall
myInstall:
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/bin
	install -m 755 $(WORK_DIR)/$(PKG_DIR)/CuraEngine $(STAGING_INSTALL_PREFIX)/bin/

