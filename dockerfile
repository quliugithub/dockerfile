#设置集成镜像
FROM ubuntu
#作者信息
MAINTAINER from xxx by pam
RUN mv /etc/apt/sources.list  /etc/apt/sources.listbk
RUN echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic-security main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb http://mirrors.cloud.tencent.com/ubuntu/ bionic-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic main restricted universe multiverse" >>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic-security main restricted universe multiverse">>/etc/apt/sources.list
RUN echo "deb-src http://mirrors.cloud.tencent.com/ubuntu/ bionic-updates main restricted universe multiverse" >>/etc/apt/sources.list
RUN apt-get update

#安装ssh服务
RUN apt-get install openssh-server -y
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

#取消pam限制
RUN sed -ri 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd
ADD authorized_keys /root/.ssh/authorized_keys
ADD run.sh /run.sh
RUN chmod 755 /run.sh

#开放端口
EXPOSE 22


#设置自启动命令
CMD ["/run.sh"]
