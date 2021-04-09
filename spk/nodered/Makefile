SPK_NAME = nodered
SPK_VERS = 1.3.1
SPK_REV = 1
SPK_ICON = src/nodered.png

DEPENDS = cross/nodered

MAINTAINER = DigitalBox
DESCRIPTION = Node-RED is a programming tool for wiring together hardware devices, APIs and online services in new and interesting ways.

DISPLAY_NAME = "Node-RED"

HOMEPAGE = https://nodered.org

SPK_DEPENDS = "Node.js_v12"

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 1880
STARTABLE = yes

# Pure NodeJS package, make sure ARCH is not defined
override ARCH=

FWPORTS = src/nodered.sc

# Admin link
ADMIN_PORT = $(SERVICE_PORT)

INSTALL_TARGET = nop

include ../../mk/spksrc.spk.mk

