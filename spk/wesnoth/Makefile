SPK_NAME = wesnoth
SPK_VERS = 1.14.15
SPK_REV = 2
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

include ../../mk/spksrc.spk.mk

