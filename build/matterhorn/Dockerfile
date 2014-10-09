# DOCKER-VERSION 1.1.2

FROM centos:centos6
ENV         matterhorn_ver 1.4
ENV         matterhorn_branch 1.4.x
RUN         ["/bin/mkdir","/RPMS"]
RUN         ["/usr/sbin/groupadd","-g","500","matterhorn"]
RUN         ["/usr/sbin/useradd","-u","500","-g","500","-M","-r","matterhorn"]
RUN         ["/bin/rpm","-Uvh","http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"]
RUN         ["/bin/rpm","-Uvh","http://yumrepo-public.library.northwestern.edu/nul-repo-1.0-1.noarch.rpm"]
RUN         ["/usr/bin/yum","install","-y","tar","java-1.7.0-openjdk","jam","libjpeg-turbo", \
              "libpng","libtiff","scons","SDL","zlib", "qt_sbtl_embedder","tesseract","mediainfo"]
RUN         ["/bin/mkdir","-p","/usr/local/matterhorn"]
WORKDIR     /usr/local/matterhorn
ADD         https://codeload.github.com/avalonmediasystem/avalon-felix/tar.gz/${matterhorn_branch} /tmp/matterhorn-${matterhorn_ver}.tar.gz
RUN         /bin/tar xzf /tmp/matterhorn-${matterhorn_ver}.tar.gz --strip-components 1
ADD         config.properties /usr/local/matterhorn/etc/config.properties
EXPOSE      8080
WORKDIR     /usr/local/matterhorn
ENTRYPOINT  /usr/local/matterhorn/bin/start_matterhorn.sh
