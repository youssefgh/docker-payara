FROM mooo.tech/openjdk:8.191.12-r0

MAINTAINER Youssef GHOUBACH <ghoubach.youssef@gmail.com>

RUN apk add --update \
    curl

ENV VERSION 5.184

ENV PACKAGE_NAME payara-$VERSION

ENV PACKAGE_ZIP $PACKAGE_NAME.zip

ENV PACKAGE https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/$VERSION/$PACKAGE_ZIP

RUN cd /opt \
    && curl -O $PACKAGE \
    && unzip $PACKAGE_ZIP \
    && rm $PACKAGE_ZIP

EXPOSE 8080

WORKDIR /opt/payara5/glassfish/bin