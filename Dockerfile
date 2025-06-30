FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
	ca-certificates \
	curl \
	bash \
	vim \
	git \
	bind9-dnsutils \
	bridge-utils \
	conntrack \
	ethtool \
	ipset \
	iptables \
	openssh-server \
	strace \
	jq \
	iproute2 \
	iputils-ping \
	iputils-arping \
	mtr \
	traceroute \
	tcptraceroute \
	net-tools \
	tcpdump \
	tshark \
	frr \
	frr-pythontools && \
    apt clean

USER root
WORKDIR /root
ENV HOSTNAME=ya-kit

COPY motd motd

RUN chmod -R g=u /root
RUN chown root:root /usr/bin/dumpcap
 
CMD ["bash"]
