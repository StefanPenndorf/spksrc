SPK_NAME = curaengine
SPK_VERS = 4.8.0
SPK_REV = 2
SPK_ICON = src/curaengine.png

DEPENDS = cross/$(SPK_NAME)
REQUIRED_DSM = 5.0

MAINTAINER = DigitalBox
DESCRIPTION  = CuraEngine is a powerful, fast and robust engine for processing 3D models into 3D printing instruction for Ultimaker and other GCode based 3D printers.
STARTABLE = no
DISPLAY_NAME = CuraEngine

HOMEPAGE = https://ultimaker.com
LICENSE  = AGPLv3

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = curaengine_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: curaengine_extra_install
curaengine_extra_install:
	install -m 755 -d $(STAGING_DIR)/resources
	install -m 755 -d $(STAGING_DIR)/resources/definitions
	install -m 755 -d $(STAGING_DIR)/resources/extruders
	install -m 644 src/resources/definitions/* $(STAGING_DIR)/resources/definitions/
	install -m 644 src/resources/extruders/* $(STAGING_DIR)/resources/extruders/

