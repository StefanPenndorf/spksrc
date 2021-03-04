PKG_NAME = jbomberman
PKG_VERS = 1.2
PKG_EXT = jar
PKG_DIST_NAME = JBomberman-${PKG_VERS}-Server.${PKG_EXT}
PKG_DIST_SITE = https://github.com/HSR-SE2Proj/JBomberman/releases/download/v${PKG_VERS}
PKG_DIR = jbomberman

DEPENDS =

HOMEPAGE = https://github.com/HSR-SE2Proj/JBomberman

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = jbomberman_install

include ../../mk/spksrc.cross-cc.mk

.PHONY: jbomberman_install
jbomberman_install:
	cp ../../distrib/$(PKG_DIST_NAME) $(STAGING_INSTALL_PREFIX)/

