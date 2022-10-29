
include $(INCLUDE_DIR)/download.mk
include $(INCLUDE_DIR)/package.mk

define circuitpython/info
	PKG_NAME:=circuitpython
	PKG_SOURCE_URL:=https://github.com/adafruit/circuitpython.git
	PKG_SOURCE_PROTO:=git
	PKG_SOURCE_VERSION:=8.0.0-beta.3
	PKG_SOURCE_MD5:=9c8e6a8698f0fbce48ca3f864c9cf38b3905c2da
	# PKG_SOURCE_OPT:=--recurse-submodules --depth=1
endef

define circuitpython/prereq
	$(eval $(circuitpython/info))
	$(call Package/prereq,$(TARGET_BUILD_DIR))
	$(call Package/patches,$(TARGET_BUILD_DIR)/$(PKG_NAME),$(TOP_DIR)/$(PKG_NAME)/patches-$(PKG_SOURCE_VERSION))
endef
