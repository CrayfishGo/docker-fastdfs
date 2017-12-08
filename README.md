# docker-fastdfs


# Usage

Start the fastdfs stack using *docker-compose*:

```bash
$ docker-compose up
```
You can also choose to run it in background (detached mode):

```bash
$ docker-compose up -d
```

By default, the stack exposes the following ports:
* 22122: tracker server TCP transport
* 23000: storage server TCP transport
* 8899:  nginx transport


# Configuration

1. 手动创建目录 `/data/fastdfs`。当然这个目录可以有个为您自己的目录结构
2. 修改`config` 目录下的配置文件， 比如端口号， IP地址等配置信息。

*NOTE*: 这里我们使用docker容器的网络模式为：`host`模式，所以在部署之前，请先确认是否端口是否已经被使用。


