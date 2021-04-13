PKG_NAME = wesnoth
PKG_VERS = 1.14.16
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/wesnoth/wesnoth/archive/refs/tags
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/openssl cross/boost cross/libicu

HOMEPAGE = https://www.wesnoth.org/
COMMENT = Wesnoth 
LICENSE = GPLv2

CONFIGURE_TARGET = wesnoth-configure
INSTALL_TARGET = wesnoth-install

include ../../mk/spksrc.cross-cc.mk

GNU_CONFIGURE = 1

.PHONY: wesnoth-configure

wesnoth-configure:
	@$(MSG) "Wesnoth configure for $(NAME)"
	$(RUN) cmake . -DCMAKE_BUILD_TYPE=Release -DENABLE_GAME=no -DENABLE_SERVER=yes -DCRYPTO_INCLUDE_DIR=$(WORK_DIR)/openssl-1.1.1i/include/ -DCRYPTO_LIBRARY=$(WORK_DIR)/openssl-1.1.1i/ -DBOOST_ROOT=$(WORK_DIR)/boost_1_63_0/ 
	$(RUN) make

wesnoth-install:
	@$(MSG) "Wesnoth install for $(NAME)"
	$(RUN) make install DESTDIR=$(STAGING_INSTALL_PREFIX)

