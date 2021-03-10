PKG_NAME = povray
PKG_VERS = 3.7.0.8
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/POV-Ray/${PKG_NAME}/archive
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/boost cross/zlib cross/libpng cross/libjpeg cross/libtiff

HOMEPAGE = https://www.povray.org/
COMMENT  = The Persistence of Vision Raytracer is a high-quality, Free Software tool for creating stunning three-dimensional graphics.
LICENSE  = AGPLv3

GNU_CONFIGURE = 1

CONFIGURE_ARGS = 

CONFIGURE_TARGET = povray_configure

# export to improve per toolchain
export CC=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-gcc
export LD=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-ld
export RANLIB=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-ranlib
export CXX=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-g++
export AR=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-ar
export NM=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-nm
export STRIP=$(WORK_DIR)/../../../toolchain/syno$(ARCH_SUFFIX)/work/x86_64-pc-linux-gnu/bin/x86_64-pc-linux-gnu-strip

export CFLAGS=-I$(WORK_DIR)install/usr/local/povray/include
export CPPFLAGS=-I$(WORK_DIR)install/usr/local/povray/include
export LDFLAGS=-L$(WORK_DIR)install/usr/local/povray/lib


include ../../mk/spksrc.cross-cc.mk

.PHONY: povray_configure
povray_configure:
	cd $(WORK_DIR)/$(PKG_DIR)/unix ; ./prebuild.sh ; patch -i $(WORK_DIR)/../fix/001_configure.patch $(WORK_DIR)/$(PKG_DIR)/configure
	# Improve the boost part 
	export BOOST_ROOT=$(WORK_DIR)/boost_1_63_0; cd $(WORK_DIR)/$(PKG_DIR) ; ./configure COMPILED_BY="DigitalBox" --with-libjpeg=$(INSTALL_DIR)/$(INSTALL_PREFIX)/lib

