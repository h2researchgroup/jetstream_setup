#!/usr/bin/env python
# -*- coding: UTF-8

# # Initializing new VM environment with docker, text analysis tools, etc.
# RUN THIS SCRIPT AS SUPER-USER, i.e: `sudo bash init_VM.sh`

# Install latest python 3, pip, and pip3:
apt-get install python3
apt-get install python3-pip || curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
pip3 install --upgrade pip

# Install basic R tools:
apt install r-base-core

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

# Shell utilities:
apt install htop # More readable version of top, for process management
apt install ncdu # Fast, comprehensive disk investigation
apt-get install unzip # for working with zip files
# lib4shell?
# Install the many packages needed for R:
apt-get install libxml2-dev openssl libssl-dev libmariadbclient-dev librsvg2-dev libpoppler-cpp-devn libwebp-dev libmagick++-dev cargo libpq-dev postgresql-common libgsl23 libgsl-dev r-cran-rgl libftgl2 libcgal-dev libglu1-mesa-dev libglu1-mesa-dev libx11-dev libfreetype6-dev
byobu-enable # Make sure window management software is turned on

# Permissive folders so apprentices & researchers can open & edit & save files
chmod 1777 /vol_b/data/*
chmod 1777 /vol_b/data/*/*
chmod 1777 /vol_b/data/*/*/*

# Setting up git-LFS (TO DO: run this only for organization repos):
#curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
#apt-get install git-lfs
#git lfs install
#git lfs track "*.csv" # Possibly add other file types here

# Install Box SDK for working with files
#pip3 install boxsdk

# Write and call function to import NLP tools from within Python:
function import_NLP_tools {
python3 - <<END
import nltk
nltk.download('punkt')
nltk.download('stopwords')
END
}
import_NLP_tools

# Write & call function to install other key packages in R:

# Set user permissions with custom playbook:
ansible-playbook jetstream-playbook-jstor.yaml

# Initialize git
git config --global credential.helper 'cache --timeout=10800' # Make GitHub more efficient by caching credentials for three hours, requires less username & PW typing
git config --global push.default simple # Configure simple git push

# Prep for RStudio-Server:
#bash init_RStudio.sh

# Install R packages:
#bash install_r_packages_cmd.sh
