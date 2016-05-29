# OpenWRT 上利用 CloudXNS 实现 DDNS 的脚本

前期准备:
安装 curl ddns-scripts luci-app-ddns 这几个软件包

使用方法：
将此脚本放在路由器的任意位置，然后进入路由器管理界面的 `Service - Dynamic DNS` 页面，新建或修改一个现有项目，
- 勾选 `Enable`
- `IP address version` 选择 `IPV4`
- `DDNS Service provider [IPv4]` 选 `自定义`
- `Custom update-URL` 留空
- `Custom update-script` 填此脚本放置的路径，如 `/root/update.sh`
- `Hostname/Domain` 填 CloudXNS 上要进行 DDNS 解析的域名，如 `xyz.example.com`
- `用户名` 填 CloudXNS 的 API key
- `密码` 填 CloudXNS 的 SECRET KEY
- 点"保存&应用"，返回上一页后点“开始”

相关资料：
https://wiki.openwrt.org/doc/uci/ddns
