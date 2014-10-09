#!/bin/bash
cd /home/makerpm/
rpmdev-setuptree
rpm -i ffmpeg-1.2-59a.el6.src.rpm
rpmbuild -ba rpmbuild/SPECS/ffmpeg12.spec
