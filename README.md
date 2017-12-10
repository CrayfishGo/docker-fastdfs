
# Preparation
* Get the `tracker` image from here: [fastdfs_tracker](https://github.com/Evan1120/fastdfs_tracker)
* Get the `storage` image from here: [fastdfs_storage](https://github.com/Evan1120/fastdfs_storage)

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

1. Manually create the directory `/data/fastdfs`. Also, you can specify your customized directory, such as: `/home/fastdfs`.
2. Modify configuration files which under the `config` folder.



