#!/bin/bash
#
CropID="wx27bd07d728e8e185"

Secret="ZmiHuuhu_pcYatRgjZDATxsjOlJB7m2xsg21YjNs8Sw"
#Secret="AQrcwqXyp3aW5Mm1yF4f80cA8s-2R68DGi8XJyzO46TA61SqFT5CH7nuOV2M_jYx"

GURL="https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=$CropID&corpsecret=$Secret"
Gtoken=$(/usr/bin/curl -s -G $GURL | awk -F\" '{print $4}')
PURL="https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=$Gtoken"
Content=$1
echo $Content
/usr/bin/curl --data-ascii '{ "touser": "@all", "toparty": " @all ","msgtype": "text","agentid": "0","text": {"content": "'$Content'"},"safe":"0"}' $PURL
