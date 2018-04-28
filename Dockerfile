FROM debian:stretch

RUN apt-get update && apt-get install -y build-essential wget curl git ssh tar gzip ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN apt-get install -y unzip

RUN mkdir -p /tools/cc65-temp
RUN mkdir -p /tools/cc65

RUN cd /tools/cc65-temp && wget ftp://ftp.musoftware.de/pub/uz/cc65/cc65-sources-2.13.3.tar.bz2 && tar xvjf cc65-sources-2.13.3.tar.bz2;
RUN cd /tools/cc65-temp/cc65-2.13.3 && make --file=./make/gcc.mak
RUN mv tools/cc65-temp/cc65-2.13.3/* /tools/cc65
RUN mkdir -p /tools/cc65/bin 
RUN find /tools/cc65 -type f -executable -exec cp {} tools/cc65/bin/ \;

RUN mkdir -p /tools/cc65-temp/neslib_famitracker && cd /tools/cc65-temp/neslib_famitracker && wget http://shiru.untergrund.net/files/src/cc65_neslib_famitracker.zip && unzip cc65_neslib_famitracker.zip
RUN mv /tools/cc65-temp/neslib_famitracker /tools

RUN apt-get install -y python-pip
RUN pip install awscli