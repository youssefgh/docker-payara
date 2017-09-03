FROM mooo.tech/openjdk:8.131.11-r2

MAINTAINER Youssef GHOUBACH <ghoubach.youssef@gmail.com>

RUN apk add --update \
    curl=7.54.0-r0

ENV VERSION 4.1.2.172

ENV PACKAGE_NAME payara-$VERSION

ENV PACKAGE_ZIP $PACKAGE_NAME.zip

ENV PACKAGE https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/Payara+$VERSION/$PACKAGE_ZIP

RUN mkdir /opt \
    && cd /opt \
    && curl -O $PACKAGE \
    && unzip $PACKAGE_ZIP \
    && rm $PACKAGE_ZIP

EXPOSE 8080

WORKDIR /opt/payara41/glassfish/bin