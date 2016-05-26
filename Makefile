#
# Copyright (C) 2011-2012 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

UKG_NAME:=wooyunwifi_ofdoom
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/wooyunwifi_ofdoom
  SECTION:=wooyun
  CATEGORY:=wooyunwifi_ofdoom
  TITLE:=wooyunwifi_ofdoom
  MAINTAINER:=lxj616
endef

define Package/wooyunwifi_ofdoom/description
 openvpn preconfiguration to provide private lan access
                                    ------ lxj616@wooyun
endef

define Build/Prepare
	$(INSTALL_DIR) $(PKG_BUILD_DIR)
	$(CP) ./conf $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/wooyunwifi_ofdoom/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_DIR) $(1)/etc/openvpn
	$(INSTALL_DIR) $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/conf/ca.crt $(1)/etc/openvpn
	$(CP) $(PKG_BUILD_DIR)/conf/target.crt $(1)/etc/openvpn
	$(CP) $(PKG_BUILD_DIR)/conf/target.key $(1)/etc/openvpn
	$(CP) $(PKG_BUILD_DIR)/conf/target.ovpn $(1)/etc/openvpn
	$(CP) $(PKG_BUILD_DIR)/conf/openvpn $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/conf/firewall $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/conf/network $(1)/etc/config
	$(CP) $(PKG_BUILD_DIR)/conf/firewall.user $(1)/etc
endef

$(eval $(call BuildPackage,wooyunwifi_ofdoom))
