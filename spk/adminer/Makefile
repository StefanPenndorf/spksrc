SPK_NAME = adminer
SPK_VERS = 4.7.6
SPK_REV = 3
SPK_ICON = src/adminer.png
DSM_UI_DIR = app

DEPENDS  = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Adminer is a full-featured database management tool available for MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB.
DESCRIPTION_FRE = Adminer est un outil de gestion de base de données complet disponible pour MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, ElasticSearch et MongoDB.

ADMIN_URL = /adminer-web/
DISPLAY_NAME = Adminer
CHANGELOG = Update to 4.7.6

HOMEPAGE   = https://www.adminer.org
LICENSE    = Apache License 2.0 or GPL 2

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

# Pure PHP package, make sure ARCH is not defined
override ARCH=

include ../../mk/spksrc.spk.mk


