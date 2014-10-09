# DOCKER-VERSION 1.1.2

FROM   centos:centos6
ENV    ffmpeg_ver 1.2-59a.el6
RUN    ["/bin/rpm","-Uvh","http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"]
RUN    ["/bin/rpm","-Uvh","http://yumrepo-public.library.northwestern.edu/nul-repo-1.0-1.noarch.rpm"]
RUN    ["/usr/sbin/useradd","-r","-m","-d","/home/makerpm","makerpm"]
RUN    ["/usr/bin/yum","-y","groupinstall","Development tools"]
RUN    ["/usr/bin/yum","install","-y","rpmdevtools"]
RUN    ["/usr/bin/yum","install","-y","SDL-devel","a52dec-devel","bzip2-devel","faad2-devel", \
        "freetype-devel","frei0r-plugins-devel", "gsm-devel","imlib2-devel","lame-devel", \
        "libdc1394-devel","libraw1394-devel","librtmp-devel", "libtheora-devel","libva-devel", \
        "libfaac-devel","libvdpau-devel","libvorbis-devel","libvpx-devel", "opencore-amr-devel", \
        "opencv-devel","openjpeg-devel","schroedinger-devel","speex-devel","texi2html", \
        "vo-aacenc-devel","x264-devel","xvidcore-devel","yasm"]
ADD    ./src/ffmpeg-${ffmpeg_ver}.src.rpm /home/makerpm/
ADD    ./src/install_ffmpeg_src.sh /home/makerpm/
RUN    ["/bin/chown","makerpm:makerpm","/home/makerpm/install_ffmpeg_src.sh"]
RUN    ["/bin/chmod","0755","/home/makerpm/install_ffmpeg_src.sh"]
RUN    ["/bin/su","-l","makerpm","-c '/home/makerpm/install_ffmpeg_src.sh'"]
RUN    ["cp","-r","/home/makerpm/rpmbuild/RPMS","/RPMS"]
VOLUME /RPMS
CMD    ["echo","ffmpeg packages in /RPMS"]
#RUN  rpm -i /home/makerpm/rpmbuild/RPMS/x86_64/ffmpeg-libs-${ffmpeg_ver}.x86_64.rpm
#RUN  rpm -i /home/makerpm/rpmbuild/RPMS/x86_64/ffmpeg-${ffmpeg_ver}.x86_64.rpm
