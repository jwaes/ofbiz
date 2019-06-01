FROM openjdk:8
MAINTAINER jaco <jaco.waes@gmail.com>

RUN apt-get update && apt-get upgrade -y && apt-get clean

## Clone/Checkout OFbiz from github
WORKDIR /

RUN mkdir /ofbiz && svn checkout http://svn.apache.org/repos/asf/ofbiz/branches/release16.11 /ofbiz

## compile ofbiz
WORKDIR /ofbiz

COPY entityengine.xml framework/entity/config/

### set default 2G memory for OFBiz. 
ENV JAVA_OPTS -Xmx2G 

RUN apt-get install wget
RUN wget -nv -P /ofbiz/framework/entity/lib/jdbc/ https://jdbc.postgresql.org/download/postgresql-42.2.5.jar

##for Derby Database
VOLUME /ofbiz/runtime/data

EXPOSE 8443 8080

ENTRYPOINT ./gradlew ofbiz
