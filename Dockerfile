FROM alpine

RUN apk add --update dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf
ENTRYPOINT ["dnsmasq", "--no-daemon"]
