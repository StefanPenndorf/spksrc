SPK_NAME = postgresql
SPK_VERS = 11.6
SPK_REV = 2
SPK_ICON = src/postgresql.png

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = PostgreSQL is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance

RELOAD_UI = yes
DISPLAY_NAME = PostgreSQL
STARTABLE = yes

CHANGELOG = "Improve wizard during install to setup port"

HOMEPAGE   = http://www.postgresql.com
LICENSE    = PostgreSQL Licence

WIZARDS_DIR = WIZARD_UIFILES

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT = src/start-stop-status.sh

include ../../mk/spksrc.spk.mk

