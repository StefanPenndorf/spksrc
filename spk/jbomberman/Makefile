SPK_NAME = jbomberman
SPK_VERS = 1.2
SPK_REV = 1
SPK_ICON = src/jbomberman.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION =  A Bomberman Clone, which can be played by up to 4 Players

DISPLAY_NAME = "JBomberman Server"

HOMEPAGE = https://github.com/HSR-SE2Proj/JBomberman

SPK_DEPENDS = "rabbitmq"

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 15672
STARTABLE = yes

FWPORTS = src/jbomberman.sc

# Make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk

