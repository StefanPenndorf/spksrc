SPK_NAME = wesnoth
SPK_VERS = 1.14.16
SPK_REV = 3
SPK_ICON = src/wesnoth.png

DEPENDS = cross/$(SPK_NAME) 

MAINTAINER = DigitalBox
DESCRIPTION = The Battle for Wesnoth is an open source, turn-based strategy game with a high fantasy theme. It features both singleplayer and online/hotseat multiplayer combat.

DISPLAY_NAME = Wesnoth

HOMEPAGE   = https://www.wesnoth.org/
LICENSE    = GPLv2

RELOAD_UI = yes
STARTABLE = yes

WIZARDS_DIR = WIZARD_UIFILES

SERVICE_USER  = auto
SERVICE_SETUP = src/service-setup.sh
NO_SERVICE_SHORTCUT = yes

POST_STRIP_TARGET = wesnoth_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: wesnoth_extra_install
wesnoth_extra_install:
	# Create required directories
	install -m 755 -d ${STAGING_DIR}/var
	# Wesnoth Config
	install -m 644 src/wesnoth.cfg ${STAGING_DIR}/var/wesnoth.cfg

