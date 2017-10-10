#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
yum -y install wget gcc make zlib-devel &&
yum -y install readline-devel bzip2-devel ncurses-devel sqlite-devel gdbm-devel xz-devel tk-devel &&

cd /tmp/ &&
#安装版本根据实际需要修改，最新的是3.7.0（2017/10/09），不过我为了稳定，选择了3.6.2，
wget https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz &&
xz -d Python-3.6.2.tar.xz &&
tar -xf Python-3.6.2.tar &&
cd Python-3.6.2 &&
./configure --prefix=/usr/local/python3.6 --enable-optimizations &&
# --prefix 是预期安装目录，--enable-optimizations 是优化选项
make && make install &&
mv /usr/bin/python /usr/bin/python-2.7.backup &&
mv /usr/bin/pip /usr/bin/pip-2.7.backup &&
ln -s /usr/local/python3.6/bin/python3 /usr/bin/python3 &&
ln -s /usr/local/python3.6/bin/pip3 /usr/bin/pip3 &&
#将change_py3.py文件放在指定位置
python3 /tmp/change_py3.py &&
pip3 install virtualenv &&
ln -s /usr/local/python3.6/bin/virtualenv /usr/bin/virtualenv 
