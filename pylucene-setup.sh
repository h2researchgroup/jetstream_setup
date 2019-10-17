# -*- coding: UTF-8

# # Initializing new VM environment with PyLucene
# RUN THIS SCRIPT AS SUPER-USER, i.e: `sudo bash pylucene-setup.sh`

# Install requirements for Apache StandardTokenizer:
apt-get install python-dev python3-dev gcc libssl-doc build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev python-pip autoconf libtool pkg-config python-opengl python-pyrex python-pyside.qtopengl idle-python2.7 idle-python3.6 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 libssl-dev libpq-dev libxslt1-dev libldap2-dev libsasl2-dev python-dateutil python-docutils python-feedparser python-gdata python-jinja2 python-ldap python-libxslt1 python-lxml python-mako python-mock python-openid python-psycopg2 python-psutil python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-unittest2 python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi # requiremenets
#wget http://mirrors.gigenet.com/apache/lucene/pylucene/pylucene-8.1.1-src.tar.gz # download pylucene
tar -xzvf pylucene-8.1.1.tar.gz # unpack pre-modified PyLucene install files
cd pylucene-8.1.1/

# Changes to make prior to installing JCC
# NOTE 1: On page 2 of jcc/setup.py, change /usr/lib/jvm/java-8-oracle/ -> /usr/lib/jvm/java-11-openjdk-amd64/ or you will get `directory does not exist` error
# NOTE 2: On page 4 of jcc/setup.y, change LFLAGS to the following (if using 64-bit CPUs) or you will get 'collect2: error: ld returned 1 exit status':
# 'linux/x86_64': ['-L%(linux)slib/' %(JDK), '-ljava',
#                  '-L%(linux)slib/server' %(JDK), '-ljvm',
#                  '-Wl,-rpath=%(linux)slib/:%(linux)slib/server' %(JDK)],

# Install JCC
python3 jcc/setup.py build
python3 jcc/setup.py install

# Edit pylucene-8.1.1/Makefile as follows:
# unedit lines for "Linux" on page 2 (see instructions at top of Makefile, edit them so they are like the following (without the comment marks):

# Linux     (Debian Jessie 64-bit, Python 3.4.2, Oracle Java 1.8
# Be sure to also set JDK['linux'] in jcc's setup.py to the JAVA_HOME value
# used below for ANT (and rebuild jcc after changing it).
#PREFIX_PYTHON=/usr
#ANT=JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ /usr/bin/ant
#PYTHON=$(PREFIX_PYTHON)/bin/python3
#JCC=$(PYTHON) -m jcc --shared
#NUM_FILES=10

# Make & install PyLucene:
make
make test
make install
