FROM centos:7

WORKDIR /var/www/html

RUN yum -y update \
    && yum -y install curl httpd git make \
    && curl --silent --location https://rpm.nodesource.com/setup_13.x | bash - \
    && yum -y install nodejs

COPY codigo-fonte/ /var/www/html/

ENV TZ="America/Sao_Paulo"
RUN date

RUN chmod 777 -R /var/www/html/

CMD [ "sh", "-c", "httpd -DFOREGROUND" ]
