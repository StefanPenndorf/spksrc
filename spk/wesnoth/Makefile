SPK_NAME = wesnoth
SPK_VERS = 1.14.15
SPK_REV = 1
SPK_ICON = src/wesnoth.png

DEPENDS = cross/$(SPK_NAME) 

SPK_DEPENDS = 

MAINTAINER = DigitalBox
DESCRIPTION = The Battle for Wesnoth is an open source, turn-based strategy game with a high fantasy theme. It features both singleplayer and online/hotseat multiplayer combat.

DISPLAY_NAME = Wesnoth

HOMEPAGE   = https://www.wesnoth.org/
LICENSE    = GPLv2

SERVICE_USER  = auto
SERVICE_SETUP = src/service-setup.sh
STARTABLE     = yes

# Service configuration
SERVICE_PORT = 15001
SERVICE_PORT_TITLE = Wesnoth

#POST_STRIP_TARGET = wesnoth_extra_install

include ../../mk/spksrc.spk.mk

#.PHONY: wesnoth_extra_install
#wesnoth_extra_install:
	# Create required directories
	#install -m 755 -d ${STAGING_DIR}/etc
	# Config
	#install -m 644 src/wesnoth.conf ${STAGING_DIR}/var/wesnoth.conf
