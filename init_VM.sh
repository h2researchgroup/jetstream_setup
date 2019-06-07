#!/usr/bin/env python
# -*- coding: UTF-8

# # Initializing new VM environment with docker, text analysis tools, etc.
# RUN THIS SCRIPT AS SUPER-USER, i.e: `sudo bash init_VM.sh`

# Update conda, install R Jupyter environment, prep for RStudio-Server
conda update -n base conda
ezj -R # Note: This starts a Jupyter server. Kill it with Ctrl-C
export PATH="/opt/anaconda3/bin:$PATH"
chown ${USER}:iplant-everyone /opt/anaconda3/ -R
echo "export RSTUDIO_WHICH_R='/opt/anaconda3/bin/R'" >> ~/.bash_profile
apt-get install gdebi-core
wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.1335-amd64.deb # Update this URL to latest Ubuntu-specific version  here: https://www.rstudio.com/products/rstudio/download-server/
sudo gdebi rstudio-server-1.2.1335-amd64.deb # First try won't work, but it will work after this
sudo sh -c 'echo "rsession-which-r=/opt/anaconda3/bin/R" >> /etc/rstudio/rserver.conf'
conda install -c conda-forge r-stm  # Install STM R package (this may fail, working out dependency conflicts)
# Restart terminal, then start RStudio-Server with these commands:
#sudo gdebi rstudio-server-1.2.1335-amd64.deb
#rm rstudio-server-1.2.1335-amd64.deb
#sudo rstudio-server start
# Now you can login to the VM's RStudio-Server using: VM_IP.jetstream-cloud.org:8787
# To troubleshoot this process, see help here: https://cyverse-ez-quickstart.readthedocs-hosted.com/en/latest/rstudio.html

# Install latest python 3, pip, and pip3:
apt-get install python3
apt-get install python3-pip || curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py
pip3 install --upgrade pip

# Install unzip for working with .zip files:
apt-get install unzip

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

# Set user permissions with custom playbook:
ansible-playbook jetstream-playbook-jstor.yaml

# Initialize git
git config --global credential.helper 'cache --timeout=10800' # Make GitHub more efficient by caching credentials for three hours, requires less username & PW typing
git config --global push.default simple # Configure simple git push

