SPK_NAME = sspks
SPK_VERS = 0.1
SPK_REV = 1
SPK_ICON = src/sspks.png
DSM_UI_DIR = app

DEPENDS  = cross/$(SPK_NAME)

MAINTAINER = Jdel.org
DESCRIPTION = A very simple Synology Package Server, reverse engineered from the official Synology package repository and SynoCommunity.
ADMIN_URL = /sspks/
RELOAD_UI = yes
DISPLAY_NAME = SSPKS

LICENSE  = GPL 3

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT = src/dsm-control.sh

SPK_DEPENDS = "WebStation>=2.1.0:PHP7.4>=7.4.0:Apache2.4>=2.4.0"
INSTALL_DEP_SERVICES = apache-web
START_DEP_SERVICES = apache-web
INSTUNINST_RESTART_SERVICES = apache-web
CONF_DIR = src/conf
SYSTEM_GROUP = http
POST_STRIP_TARGET = sspks_extra_install

# Pure PHP package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: sspks_extra_install
sspks_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 755 -d $(STAGING_DIR)/web
