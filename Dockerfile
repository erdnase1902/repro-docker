FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update; apt-get install -y build-essential git debhelper gperf libasio-dev libboost-dev libc-ares-dev libdb++-dev libpopt-dev default-libmysqlclient-dev libpq-dev libradcli-dev libcppunit-dev autotools-dev libpcre3-dev libsipxtapi-dev dh-autoreconf pkg-config libtelepathy-qt5-dev libgloox-dev libqpid-proton-cpp-dev libssl-dev libsrtp2-dev
RUN git clone https://github.com/resiprocate/resiprocate.git
RUN cd resiprocate; cd repro; cp -rf ../contrib/cajun/include/cajun /usr/include/; cd ..; \
autoreconf --install; ./configure --with-repro --disable-shared; make -j8; make install; cd ..
CMD cd resiprocate/repro; repro;