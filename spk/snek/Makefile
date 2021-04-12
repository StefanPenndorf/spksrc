SPK_NAME = snek
SPK_VERS = 1.0
SPK_REV = 1
SPK_ICON = src/snek.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Snek is a web-based, multiplayer version of Snake, using a JavaScript server (running using Node.js) and a simple HTML, CSS, and jQuery/plain JS client that connects to the server using websockets.

DISPLAY_NAME = "Snek"

HOMEPAGE = https://github.com/flukeout/snek

SPK_DEPENDS = "Node.js_v12"

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 3000
STARTABLE = yes

# Pure NodeJS package, make sure ARCH is not defined
override ARCH=

FWPORTS = src/snek.sc

include ../../mk/spksrc.spk.mk

