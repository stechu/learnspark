FROM openjdk:8
MAINTAINER Shumo Chu <shumo.chu@gmail.com>

RUN apt-get update && \
    apt-get install -y \
      binutils \
      curl \
      git \
      g++ \
      make \
      software-properties-common \
      vim \
      wget \
      fish 

