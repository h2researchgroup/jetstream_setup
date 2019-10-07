# -*- coding: UTF-8

# # Initializing new VM environment with PyLucene
# RUN THIS SCRIPT AS SUPER-USER, i.e: `sudo bash pylucene-setup.sh`

# Install tools for Apache StandardTokenizer:
apt-get install python-dev python3-dev gcc libssl-doc build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip autoconf libtool pkg-config python-opengl python-pyrex python-pyside.qtopengl idle-py$apt-get install ant ivy # Install Apache Ant and Apache Ivy
apt-get install openjdk-11-jdk-headless # Install Java Compiler
wget http://mirrors.gigenet.com/apache/lucene/pylucene/pylucene-8.1.1-src.tar.gz # download pylucene
tar -xzvf pylucene-8.1.1-src.tar.gz # unpack

# Changes to make prior to installing JCC
# NOTE 1: On page 2 of jcc/setup.py, change /usr/lib/jvm/java-8-oracle/ -> /usr/lib/jvm/java-11-openjdk-amd64/ or you will get `directory does not exist` error
# NOTE 2: On page 4 of jcc/setup.y, change LFLAGS to the following (if using 64-bit CPUs) or you will get 'collect2: error: ld returned 1 exit status':
# 'linux/x86_64': ['-L%(linux)slib/' %(JDK), '-ljava',
#                  '-L%(linux)slib/server' %(JDK), '-ljvm',
#                  '-Wl,-rpath=%(linux)slib/:%(linux)slib/server' %(JDK)],

# Install JCC
python3 pylucene-8.1.1/jcc/setup.py build
python3 pylucene-8.1.1/jcc/setup.py install

