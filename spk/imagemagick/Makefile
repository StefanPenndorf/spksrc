SPK_NAME = imagemagick
SPK_VERS = 7.0.10
SPK_REV = 5
SPK_ICON = src/imagemagick.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = ImageMagick is a software suite to create, edit, compose, or convert bitmap images.
DISPLAY_NAME = ImageMagick
CHANGELOG = Update to ImageMagick 7.0.10-61

ADMIN_URL = /imagemagick/
RELOAD_UI = yes
DISPLAY_NAME = ImageMagick

HOMEPAGE = https://www.imagemagick.org/
LICENSE  = Apache 2.0

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT = src/dsm-control.sh

SPK_DEPENDS = "WebStation>=2.1.0:PHP7.4>=7.4.0:Apache2.4>=2.4.0"
INSTALL_DEP_SERVICES = apache-web
START_DEP_SERVICES = apache-web
INSTUNINST_RESTART_SERVICES = apache-web

CONF_DIR = src/conf
SYSTEM_GROUP = http

POST_STRIP_TARGET = imagemagick_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: imagemagick_extra_install
imagemagick_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 755 -d $(STAGING_DIR)/web/work_images
	install -m 644 src/app/config $(STAGING_DIR)/app/config

