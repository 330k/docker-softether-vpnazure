#!/bin/sh

/usr/local/vpnserver/vpnserver start

sleep 3s

/usr/local/vpnserver/vpncmd /SERVER localhost /CMD DynamicDnsSetHostname $HOSTNAME
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD HubCreate $HUBNAME /PASSWORD:$HUBPASS
/usr/local/vpnserver/vpncmd /SERVER localhost /HUB:$HUBNAME /PASSWORD:$HUBPASS /CMD UserCreate $USERNAME /GROUP:none /REALNAME:none /NOTE:none
/usr/local/vpnserver/vpncmd /SERVER localhost /HUB:$HUBNAME /PASSWORD:$HUBPASS /CMD UserPasswordSet $USERNAME /PASSWORD:$USERPASS
/usr/local/vpnserver/vpncmd /SERVER localhost /HUB:$HUBNAME /PASSWORD:$HUBPASS /CMD SecureNatEnable
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD IPsecEnable /L2TP:no /L2TPRAW:no /ETHERIP:no /PSK:DUMMYPSK /DEFAULTHUB:$HUBNAME
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD VpnAzureSetEnable yes
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD OpenVpnEnable no /PORTS:1194
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD VpnAzureGetStatus
/usr/local/vpnserver/vpncmd /SERVER localhost /CMD ServerSetPassword $SERVERPASS

tail -f /dev/null
