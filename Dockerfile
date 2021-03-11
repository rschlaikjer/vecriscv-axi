FROM ubuntu:14.04

RUN apt-get update && apt-get install -y software-properties-common

# JAVA JDK 8
RUN add-apt-repository -y ppa:openjdk-r/ppa
RUN apt-get update && apt-get install -y openjdk-8-jdk
RUN update-alternatives --config java
RUN update-alternatives --config javac

# Install SBT - https://www.scala-sbt.org/
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get update && apt-get install -y sbt
# Fix stale certs
RUN dpkg --purge --force-depends ca-certificates-java
RUN apt install -y ca-certificates-java

# SpinalHDL
WORKDIR /vex/
RUN git clone https://github.com/SpinalHDL/SpinalHDL.git \
        && cd SpinalHDL \
        && git checkout bedcf7a3fc0072d10bcc994e118955d515849fd9 \
        && sbt clean compile publishLocal

# VexRiscv
WORKDIR /vex/
RUN git clone https://github.com/SpinalHDL/VexRiscv.git \
        && cd VexRiscv \
        && git checkout 36b3cd918896c94c4e8a224d97c559ab6dbf3ec9

# Add our custom gen file
ADD GenVexRiscv.scala /vex/VexRiscv/src/main/scala/vexriscv/demo/

CMD /bin/bash
