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

RUN rm -rf ${FASTDFS_PATH}

COPY config/ /etc/fdfs

EXPOSE 22122
COPY start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh
CMD ["/usr/local/bin/start.sh"]
