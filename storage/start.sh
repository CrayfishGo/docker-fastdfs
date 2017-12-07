#!/bin/bash
fdfs_storaged /etc/fdfs/storage.conf start
/usr/local/nginx/sbin/nginx
tail -f /usr/local/nginx/logs/error.log -f /usr/local/nginx/logs/access.log -f /data/fastdfs/logs/storaged.log