FROM centos
MAINTAINER admin
LABEL description="a basic apache image container on centos7 or rhel7"
ENV PORT 8080 
RUN yum install -y httpd 
RUN sed -ri -e '/^Listen 80/c\Listen ${PORT}' /etc/httpd/conf/httpd.conf \
&& chown -R apache:apache /etc/httpd/logs/ \
&& chown -R apache:apache /run/httpd/
USER apache
VOLUME /var/www/html
EXPOSE ${PORT}
CMD ["httpd", "-D", "FOREGROUND"]
