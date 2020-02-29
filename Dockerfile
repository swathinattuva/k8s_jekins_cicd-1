FROM jenkins/jenkins

MAINTAINER prasad.telasula@yahoo.com

ADD https://releases.hashicorp.com/terraform/0.12.21/terraform_0.12.21_linux_amd64.zip /tmp/

RUN unzip /tmp/terraform_0.12.21_linux_amd64.zip /tmp/

RUN mv /tmp/terraform /usr/bin/" 

