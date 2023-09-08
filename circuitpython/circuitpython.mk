
include $(INCLUDE_DIR)/download.mk
include $(INCLUDE_DIR)/package.mk

define circuitpython/info
	PKG_NAME:=circuitpython
	PKG_SOURCE_URL:=https://github.com/adafruit/circuitpython.git
	PKG_SOURCE_PROTO:=git
	PKG_SOURCE_VERSION:=8.2.5
	PKG_SOURCE_MD5:=4dd45b6dc6e00eea20a8b03c9fb3131cfb2bb7ee
	# PKG_SOURCE_OPT:=--recurse-submodules --depth=1
endef

define circuitpython/prereq
	$(eval $(circuitpython/info))
	$(call Package/prereq,$(TARGET_BUILD_DIR))
	$(call Package/patches,$(TARGET_BUILD_DIR)/$(PKG_NAME),$(TOP_DIR)/$(PKG_NAME)/patches-$(PKG_SOURCE_VERSION))
endef
