#!/bin/sh

pid=`ps -aux | grep advisory_uwsgi.ini | grep -v grep | awk '{print $2}'`
sudo kill ${pid}
sudo uwsgi -i advisory_uwsgi.ini
echo 'you have restart it'
