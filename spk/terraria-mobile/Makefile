SPK_NAME = terraria-mobile
SPK_VERS = 1.4.1
SPK_REV = 1
SPK_ICON = src/terraria.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Construct the world you desire! From simple dwellings to immense fortresses to intricate machinery, the choice is yours! Become the architect of your very own world!

DISPLAY_NAME = "Terraria Mobile Server"

HOMEPAGE = https://terraria.org

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_PORT = 7777
STARTABLE = yes

FWPORTS = src/terraria.sc

POST_STRIP_TARGET = terraria_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: terraria_extra_install
terraria_extra_install:
	chmod -R 755 ${STAGING_DIR}/ServerLinux
	cp src/SynoWorld.wld ${STAGING_DIR}
