FROM  qgis/qgis3-build-deps:latest
MAINTAINER Xavi Torelló <info@xaviertorello.cat>
# Based off work by Denis Rouzaud <denis@opengis.ch>
# Based off work by Tim Sutton <tim@kartoza.com>
# Based off work by Patrick Valsecchi<patrick.valsecchi@camptocamp.com>

ENV CC=/usr/lib/ccache/clang
ENV CXX=/usr/lib/ccache/clang++
ENV QT_SELECT=5
ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && apt update && apt install python3-owslib vim --no-install-recommends -y
RUN git clone --depth 1 -b final-3_0_1 git://github.com/qgis/QGIS.git /usr/src/QGIS

COPY ${CACHE_DIR} /root/.ccache
ENV CCACHE_DIR=/root/.ccache
ENV LANG C
RUN ccache -M 1G

WORKDIR /usr/src/QGIS/build

RUN cmake \
  -GNinja \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DWITH_DESKTOP=ON \
  -DWITH_SERVER=ON \
  -DWITH_3D=ON \
  -DWITH_BINDINGS=ON \
  -DBINDINGS_GLOBAL_INSTALL=ON \
  -DWITH_STAGED_PLUGINS=ON \
  -DWITH_GRASS=ON \
  -DSUPPRESS_QT_WARNINGS=ON \
  -DDISABLE_DEPRECATED=ON \
  -DENABLE_TESTS=OFF \
  -DWITH_QSPATIALITE=ON \
  -DWITH_QWTPOLAR=OFF \
  -DWITH_APIDOC=OFF \
  -DWITH_ASTYLE=OFF \
 .. \
 && ninja install \
 && rm -rf /usr/src/QGIS

WORKDIR /

# A few tunable variables for QGIS
ENV QGIS_DEBUG 5
ENV QGIS_LOG_FILE /proc/self/fd/1
ENV PGSERVICEFILE /project/pg_service.conf
ENV QGIS_PROJECT_FILE /project/project.qgs

ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
