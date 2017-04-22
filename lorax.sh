#!/bin/bash

ImageDir=$1

for x in $(seq 0 6); do
  path=/dev/loop${x}
  if ! test -b ${path}; then mknod -m660 ${path} b 7 ${x}; fi
done
rm -rf ${ImageDir}/isula_build/lorax

echo 'Running: lorax --nomacboot'
lorax --nomacboot --add-template=/root/lorax.tmpl -p iSula -v 2.0 -r 1 --isfinal \
--buildarch=x86_64 \
-s http://developer.huawei.com/ict/site-euleros/euleros/repo/yum/2.2/os/x86_64/Packages/ \
${ImageDir}/isula_build/lorax
rm -rf ${ImageDir}/isula_build/images
mkdir ${ImageDir}/isula_build/images

VERSION=isula-2.0
TAG=$( date  +%Y-%m-%d-%H-%M-%S )

cp ${ImageDir}/isula_build/lorax/images/boot.iso ${ImageDir}/isula_build/images/${VERSION}${TAG}.iso
cd ${ImageDir}/isula_build/images/

cd ${ImageDir}/isula_build/
rm -rf *.tar.xz

tar cvf ${VERSION}${TAG}_PXE.tar lorax/
xz -z ${VERSION}${TAG}_PXE.tar
mv *_PXE.tar.xz images/
cd /srv/antos_tmp/images/
