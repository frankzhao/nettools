FROM alpine:latest
MAINTAINER Frank Zhao <frank@frankzhao.net>

# Install tools
RUN apk --update add \
    iputils net-tools tcpdump \
    ethtool iperf findutils bash

CMD ["bash"]
