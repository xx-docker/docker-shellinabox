FROM centos:7
WORKDIR /opt/
USER root
#RUN yum install epel-release -y
#RUN apt-get -y install gcc gcc-c++
RUN yum install git openssl-devel pam-devel zlib-devel autoconf automake libtool -y
RUN  git clone https://github.com/shellinabox/shellinabox.git && cd shellinabox
RUN  autoreconf -i
RUN  ./configure && make
RUN ln -sn /opt/shellinabox/shellinaboxd /usr/bin/shellinaboxd
ENV HOST localhost
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
WORKDIR /opt/shellinabox/shellinabox/
#CMD 'shellinaboxd --user-css Normal:+white-on-black.css -t -s /:SSH:'${HOST}
EXPOSE 4200
