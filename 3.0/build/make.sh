#!/bin/bash
set -e

cd /usr/local/bin
ln -s /usr/bin/ccache gcc
ln -s /usr/bin/ccache g++

mkdir /build/release
cd /build/release
# ccmake ../QGIS/

cmake /build/QGIS \
    -DQWT_INCLUDE_DIR=/usr/include/qwt \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.5m.so \
    -DQSCINTILLA_INCLUDE_DIR=/usr/include/x86_64-linux-gnu/qt5 \
    -DQWT_LIBRARY=/usr/lib/libqwt-qt5.so \
    -DWITH_DESKTOP=ON \
    -DWITH_SERVER=ON \
    -DBUILD_TESTING=OFF \
    -DWITH_QWTPOLAR=ON

make install -j8
ldconfig

strip /usr/bin/qgis_mapserv.fcgi
strip `find /usr/lib/ -name "libqgis*" -type f`
strip `find  /usr/share/qgis/ -name "*.so" -type f`
