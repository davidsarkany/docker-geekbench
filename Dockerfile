FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install --no-install-recommends -y wget \
                                                  libc6:i386 \
                                                  libstdc++6:i386 \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

ENV GEEKBENCHVERSION Geekbench-5.3.0-Linux
ENV GEEKBENCHPACKAGE $GEEKBENCHVERSION.tar.gz

RUN wget --quiet --no-check-certificate https://cdn.geekbench.com/$GEEKBENCHPACKAGE -O /tmp/$GEEKBENCHPACKAGE \
    && mkdir -p /opt/geekbench \
    && tar xzf /tmp/$GEEKBENCHPACKAGE -C /opt/geekbench \
    && rm -rf /tmp/$GEEKBENCHPACKAGE

CMD ["/opt/geekbench/Geekbench-5.3.0-Linux/geekbench5"]
