SPK_NAME = nextcloud
SPK_VERS = 18.0.0
SPK_REV = 2
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

BETA = 1

WIZARDS_DIR = WIZARD_UIFILES/

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

include ../../mk/spksrc.spk.mk

