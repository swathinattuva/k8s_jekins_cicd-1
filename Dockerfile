FROM jenkins/jenkins

MAINTAINER prasad.telasula@yahoo.com

ADD https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip /opt/

WORKDIR /opt

USER root

RUN apt-get update -y \
    && apt-get install awscli -y \
    && unzip /opt/terraform_0.12.21_linux_amd64.zip \
    && mv /opt/terraform /usr/bin/

USER jenkins