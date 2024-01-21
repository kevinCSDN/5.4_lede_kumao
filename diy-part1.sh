#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge

#拉取文件包里一个插件的方法
#拉取整个包
#git clone https://github.com/haiibo/openwrt-packages 
#赋予删除的权限         
shopt -s extglob
#删除除了luci-app-bypass之外的所有插件，如果保留smartdns可以这样写rm -rf openwrt-packages/!(luci-app-bypass|luci-app-smartdns)
rm -rf openwrt-packages/!(luci-app-bypass)
#拷贝到插件库package
cp -r openwrt-packages/luci-app-bypass package/
rm -rf openwrt-packages

#删除feeds自带mosdns、v2ray-geodata
rm -rf ./feeds/packages/net/mosdns
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/luci/themes/luci-theme-argon








#克隆passwall环境插件
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage

#克隆的源码放在small文件夹,预先建立small文件夹
mkdir package/small
pushd package/small

#克隆源码

#passwall2
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git
git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git
#mosdns
# git clone -b v5 --depth 1 https://github.com/sbwml/luci-app-mosdns.git
git clone --depth=1 https://github.com/fw876/helloworld.git
# git clone https://github.com/kevinCSDN/lua-maxminddb.git  #git lua-maxminddb 依赖

# git clone https://github.com/kevinCSDN/luci-app-vssr-plus.git  

popd
