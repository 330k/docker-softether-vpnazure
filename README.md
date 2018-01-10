# docker-softether-vpnazure
Simple SSTP VPN Server using VPN Azure.
This container enables to connect network within NAT/firewall.

# run

~~~
docker run -d --cap-add NET_ADMIN --hostname vpn001 --name vpn001 330k/docker-softether-vpnazure
~~~

# Client Settings

* Protocol: SSTP
* Address: *hostname*.vpnazure.net
  * *hostname* should be unique in vpnazure, default name (*vpn-----*) is used when failed.
* Port: 443(Default)
* User: *HUBNAME*\\*USERNAME*
* Password: *USERPASS*

# Default Environmental Variables

ENV|Default Value
---|---
SERVERPASS|passw0rd
HUBNAME|hub001
HUBPASS|password
USERNAME|user001
USERPASS|foobar
