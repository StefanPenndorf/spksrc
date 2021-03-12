SPK_NAME = nextcloud
SPK_VERS = 21.0.0
SPK_REV = 4
SPK_ICON = src/nextcloud.png
DSM_UI_DIR = app

DEPENDS  = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Nextcloud puts your data at your fingertips, under your control. Store your documents, calendar, contacts and photos on a server at home, at one of our providers or in a data center you trust.

ADMIN_URL = /nextcloud/
RELOAD_UI = yes
DISPLAY_NAME = NextCloud

HOMEPAGE   = https://nextcloud.com
LICENSE    = AGPLv3

REQUIRED_DSM = 5.0

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

SPK_DEPENDS = "WebStation>=2.1.0:PHP7.4>=7.4.0"
START_DEP_SERVICES = nginx.service
CONF_DIR = src/conf
SYSTEM_GROUP = http

#INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = nextcloud_extra_install

# Pure PHP package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

.PHONY: nextcloud_extra_install
nextcloud_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
