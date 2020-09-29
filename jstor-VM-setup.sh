# -*- coding: UTF-8

# # Initializing new VM environment with docker, text analysis tools, etc.
# RUN THIS SCRIPT AS SUPER-USER, i.e: `sudo bash init_VM.sh`

# Update Ubuntu's apt-get:
apt-get update -y

# Install latest python 3, pip, and pip3:
apt-get install python3
apt-get install python3-pip || curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
pip3 install --upgrade pip

# Install basic R tools:
apt install r-base-core

# Install Apache Ant and Apache Ivy, Java Compiler - requisites for Apache StandardTokenizer:
apt-get install ant ivy openjdk-11-jdk-headless

# Docker environment:
#apt-get install docker-machine
#docker-machine create default
#docker-machine env default # Run the lines returned by this command
#pip3 install docker
#pip3 install docker-compose

# Scraping web content and URLs:
pip3 install bs4
pip3 install lxml
pip3 install google
pip3 install https://github.com/slimkrazy/python-google-places/zipball/master
pip3 install selenium
pip3 install scrapy
ansible-galaxy install cmprescott.chrome

# Processing text:
pip3 install nltk
pip3 install pandas
pip3 install tqdm
pip3 install sklearn
pip3 install gensim
pip3 install scipy
pip3 install timeout_decorator
pip3 install Cython
pip3 install spacy
python3 -m spacy download en

# Shell utilities:
apt install htop # More readable version of top, for process management
apt install ncdu # Fast, comprehensive disk investigation
apt-get install unzip # for working with zip files
byobu-enable # Make sure window management software is turned on

# Permissive folders so apprentices & researchers can open & edit & save files
#chmod 1777 /vol_b/data/*
#chmod 1777 /vol_b/data/*/*
#chmod 1777 /vol_b/data/*/*/*

# Set up git-LFS:
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
apt-get install git-lfs
# Do the next two steps within whatever repo you want to set up git-LFS in:
#git lfs install
#git lfs track *.pkl *.h5 *.json *.zip # Possibly add other file types here

# Write and call function to import NLP tools from within Python:
function import_NLP_tools {
python3 - <<END
import nltk, spacy
nltk.download('punkt')
nltk.download('stopwords')
spacy download en
END
}
import_NLP_tools

# Set user permissions with custom playbook:
ansible-playbook jetstream-playbook-jstor.yaml

# Initialize git
git config --global credential.helper 'cache --timeout=10800' # Make GitHub more efficient by caching credentials for three hours, requires less username & PW typing
git config --global push.default simple # Configure simple git push

# Install PyLucene for Apache StandardTokenizer:
bash pylucene-setup.sh
