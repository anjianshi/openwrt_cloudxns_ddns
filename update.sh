#!/bin/sh

# 参考资料:
# https://github.com/openwrt/packages/blob/master/net/ddns-scripts/samples/update_sample.sh
# https://github.com/anjianshi/cloudxns-ddns/blob/master/cloudxns.sh
#
# Requirements:
# curl

[ -z "$domain" ]   && write_log 14 "Service section not configured correctly! Missing 'domain'"
[ -z "$username" ] && write_log 14 "Service section not configured correctly! Missing 'username'"
[ -z "$password" ] && write_log 14 "Service section not configured correctly! Missing 'password'"


API_URL="https://www.cloudxns.net/api2/ddns"
API_KEY=$username
API_SECRET_KEY=$password

DATE=$(date)
PARAM="{\"domain\":\"${domain}\"}"
HMAC=$(echo -n "$API_KEY$API_URL$PARAM$DATE$API_SECRET_KEY"|md5sum|cut -d" " -f1)
RESULT=$(curl -k -s $API_URL --data $PARAM -H "API-KEY: $API_KEY" -H "API-REQUEST-DATE: $DATE" -H "API-HMAC: $HMAC" -H 'Content-Type: application/json')

write_log 7 "answered:\n$RESULT"

if [ $(echo -n "$RESULT"|grep -o "message\":\"success\""|wc -l) = 1 ];then
    return 0
else
    return 1
fi
