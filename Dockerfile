FROM openjdk:8
MAINTAINER jaco <jaco.waes@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get clean

