FROM ubuntu:16.04

ENV FASTDFS_PATH=/fastDFS_installer \
    FASTDFS_BASE_PATH=/data

#get all the dependences
RUN apt-get update && apt-get install -y \
    gcc \
    git \
    make \
    net-tools \
    build-essential \
    libtool \
    libpcre3 \
    libpcre3-dev \
    zlib1g-dev \
    openssl \
    wget \
    libssl-dev \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

#create the dirs to store the files downloaded from internet
RUN mkdir -p ${FASTDFS_PATH}/libfastcommon \
 && mkdir -p ${FASTDFS_PATH}/fastdfs \
 && mkdir -p ${FASTDFS_BASE_PATH}/fastdfs

#compile the libfastcommon
WORKDIR ${FASTDFS_PATH}/libfastcommon
RUN git clone https://github.com/happyfish100/libfastcommon.git ${FASTDFS_PATH}/libfastcommon \
 && ./make.sh \
 && ./make.sh install \
 && export LD_LIBRARY_PATH=/usr/lib64/ \
 && ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so

#compile the fastdfs
WORKDIR ${FASTDFS_PATH}/fastdfs
RUN git clone https://github.com/happyfish100/fastdfs.git ${FASTDFS_PATH}/fastdfs \
 && ./make.sh \
 && ./make.sh install

WORKDIR ${FASTDFS_PATH}/fastdfs
RUN git clone https://github.com/happyfish100/fastdfs-nginx-module.git \
    && wget http://nginx.org/download/nginx-1.13.7.tar.gz \
    && tar -zxf nginx-1.13.7.tar.gz \
    && rm nginx-1.13.7.tar.gz \
    && cd nginx-1.13.7 \
    && ./configure --add-module=${FASTDFS_PATH}/fastdfs/fastdfs-nginx-module/src \
    && make \
    && ln -s /usr/include/fast* /usr/local/include/ \
    && make install \
    && mkdir -p /data/fastdfs/storage/data \
    && ln -sv /data/fastdfs/storage/data /data/fastdfs/storage/data/M00

COPY config/ /etc/fdfs/
COPY nginx.conf /usr/local/nginx/conf/

RUN rm -rf ${FASTDFS_PATH}/

EXPOSE 23000 8899
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]
