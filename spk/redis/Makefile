SPK_NAME = redis
SPK_VERS = 6.2.5
SPK_REV = 9
SPK_ICON = src/redis.png
DSM_UI_DIR = app

DEPENDS = cross/$(SPK_NAME)

MAINTAINER = DigitalBox
DESCRIPTION = Redis is an open source, advanced key-value store. It is often referred to as a data structure server since keys can contain strings, hashes, lists, sets and sorted sets. Redis is written in ANSI C and works in most POSIX systems like Linux, *BSD, and OS X, without external dependencies. Linux and OS X are the two operating systems where Redis is developed and tested the most, and we recommend using Linux for deployment.

DISPLAY_NAME = redis

CHANGELOG = "Update to version 6.2.5"

# PPC archs except qoriq are not supported anymore
UNSUPPORTED_ARCHS = $(OLD_PCC_ARCHS)

HOMEPAGE = https://redis.io
LICENSE  = 3-clause BSD

STARTABLE = yes
SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh

POST_STRIP_TARGET = redis_extra_install

# add links for tools
SPK_COMMANDS = bin/redis-benchmark bin/redis-check-aof bin/redis-check-rdb bin/redis-cli

include ../../mk/spksrc.spk.mk

.PHONY: redis_extra_install
redis_extra_install:
	install -m 755 -d $(STAGING_DIR)/var
	install -m 644 src/redis.conf $(STAGING_DIR)/var/redis.conf
