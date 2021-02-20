PKG_NAME = sspks
PKG_VERS = 0.1
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/jdel/sspks/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://github.com/jdel/sspks
COMMENT  = A very simple Synology Package Server, reverse engineered from the official Synology package repository and SynoCommunity.
LICENSE  = GPL 3

CONFIGURE_TARGET = nop
COMPILE_TARGET = nop
INSTALL_TARGET = sspks_install


include ../../mk/spksrc.cross-cc.mk

.PHONY: sspks_install
sspks_install:
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/web
	# Define additional model
	echo "DS716+II=braswell" >>$(WORK_DIR)/$(PKG_DIR)/conf/synology_models.conf
	(cd $(WORK_DIR)/$(PKG_DIR); tar cf - *) | (cd $(STAGING_INSTALL_PREFIX)/web; tar xf -)

	#echo "{}" >$(STAGING_INSTALL_PREFIX)/web/composer.json
	#(cd $(STAGING_INSTALL_PREFIX)/web; php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"; php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"; php composer-setup.php; php -r "unlink('composer-setup.php');"; php composer.phar install --no-dev)
	#sed -i 's/\/sspks\/vendor/\/vendor/g' $(STAGING_INSTALL_PREFIX)/web/index.php
