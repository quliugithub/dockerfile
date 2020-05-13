FROM ssh1
#设置继承我们创建的sshd镜像

MAINTAINER allen from dockerpool.com(764460213@qq.com)
#创建者的基本信息


RUN \
 apt-get install -y nginx && \
 rm -fr /var/lib/apt/list/* && \
 echo "\ndaemon off;" >>/etc/nginx/nginx.conf && \
 chown -R www-data:www-data /var/lib/nginx
 
RUN apt-get install -y tzdata && \
echo "Asia/Shanghai" > /etc/timezone && \
dpkg-reconfigure -f noninteractive tzdata

ADD run.sh /run.sh
RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled","/etc/nginx/certs","/etc/nginx/conf.d","/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 80
EXPOSE 443
