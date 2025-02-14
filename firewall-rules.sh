#!/bin/bash
iptables -I DOCKER-USER -i src_if -o dst_if -j ACCEPT
iptables -t nat -C POSTROUTING -o end0 -j MASQUERADE || iptables -t nat -A POSTROUTING -o end0 -j MASQUERADE
iptables -C FORWARD -i end0 -o wlxcc641aeb915d -m state --state RELATED,ESTABLISHED -j ACCEPT || iptables -A FORWARD -i end0 -o wlxcc641aeb915d -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -C FORWARD -i wlxcc641aeb915d -o end0 -j ACCEPT || iptables -A FORWARD -i wlxcc641aeb915d -o end0 -j ACCEPT
iptables-save
