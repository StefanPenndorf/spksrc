SPK_NAME = redis
SPK_VERS = 6.2.5
SPK_REV = 9
SPK_ICON = src/redis.png
DSM_UI_DIR = app

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Redis is an open source, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets.

RELOAD_UI = yes
STARTABLE = yes
DISPLAY_NAME = redis

CHANGELOG = "Update to version 6.2.5"

WIZARDS_DIR = WIZARD_UIFILES

# PPC archs except qoriq are not supported anymore
UNSUPPORTED_ARCHS = $(OLD_PCC_ARCHS)

HOMEPAGE = https://redis.io
LICENSE  = 3-clause BSD

SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
NO_SERVICE_SHORTCUT = yes

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = redis_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: redis_extra_install
redis_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 644 src/redis.conf $(STAGING_DIR)/var/redis.conf
