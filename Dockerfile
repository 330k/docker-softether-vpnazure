FROM ubuntu
MAINTAINER 330k

ENV VERSION v4.24-9652-beta-2017.12.21

WORKDIR /usr/local/vpnserver

RUN apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install wget gcc make

RUN wget http://jp.softether-download.com/files/softether/${VERSION}-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-${VERSION}-linux-x64-64bit.tar.gz -O /tmp/softether-vpnserver.tar.gz && \
  tar xvf /tmp/softether-vpnserver.tar.gz -C /usr/local/ && \
  rm /tmp/softether-vpnserver.tar.gz && \
  make i_read_and_agree_the_license_agreement && \
  apt-get purge -y -q --auto-remove gcc make wget

ENV SERVERPASS passw0rd
ENV HUBNAME hub001
ENV HUBPASS password
ENV USERNAME user001
ENV USERPASS foobar

ADD entrypoint.sh /usr/local/vpnserver/entrypoint.sh
RUN chmod 755 /usr/local/vpnserver/entrypoint.sh

ENTRYPOINT ["/usr/local/vpnserver/entrypoint.sh"]
