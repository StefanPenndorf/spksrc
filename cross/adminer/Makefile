PKG_NAME = adminer
PKG_VERS = 4.7.6
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/vrana/adminer/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://www.adminer.org/
COMMENT  = Adminer is a full-featured database management tool written in PHP. Adminer is available for MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB.
LICENSE  = Apache License 2.0 or GPL 2

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myInstall
myInstall:
	(cd $(WORK_DIR)/$(PKG_DIR) && php compile.php && mv $(PKG_NAME)-$(PKG_VERS).php index.php)
	mkdir $(STAGING_INSTALL_PREFIX)/web/
	cp $(WORK_DIR)/$(PKG_DIR)/index.php $(STAGING_INSTALL_PREFIX)/web/index.php
	cp $(WORK_DIR)/$(PKG_DIR)/designs/rmsoft_blue/adminer.css $(STAGING_INSTALL_PREFIX)/web/adminer.css

