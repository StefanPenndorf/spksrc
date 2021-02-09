PKG_NAME = elixir
PKG_VERS = 1.8.2
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/elixir-lang/elixir/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/ncurses

HOMEPAGE = https://elixir-lang.org
COMMENT  = Elixir is a dynamic, functional language designed for building scalable and maintainable applications. Elixir leverages the Erlang VM, known for running low-latency, distributed and fault-tolerant systems, while also being successfully used in web development and the embedded software domain.

include ../../mk/spksrc.archs.mk

LICENSE = Apache License

ENV += PATH=$(WORK_DIR)/../../../native/erlang/work-native/install/usr/local/bin:$$PATH

CONFIGURE_TARGET = myConfigure

include ../../mk/spksrc.cross-cc.mk

.PHONY: myConfigure
myConfigure:
	$(RUN) echo "No configure needed"

