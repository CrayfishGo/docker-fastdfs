#!/bin/bash
fdfs_trackerd /etc/fdfs/tracker.conf start
tail -f /data/fastdfs/logs/trackerd.log