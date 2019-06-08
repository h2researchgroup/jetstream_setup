# Update conda, install R Jupyter environment, prep for RStudio-Server
conda update -n base conda
ezj -R # Note: This starts a Jupyter server. Kill it with Ctrl-C
export PATH="/opt/anaconda3/bin:$PATH"
chown ${USER}:iplant-everyone /opt/anaconda3/ -R
echo "export RSTUDIO_WHICH_R='/opt/anaconda3/bin/R'" >> ~/.bash_profile
apt-get install gdebi-core

wget https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.1335-amd64.deb 
# Update above URL to latest Ubuntu-specific version  here: https://www.rstudio.com/produc$
sudo gdebi rstudio-server-1.2.1335-amd64.deb # First try won't work, but it will work after this
sudo sh -c 'echo "rsession-which-r=/opt/anaconda3/bin/R" >> /etc/rstudio/rserver.conf'
conda install -c conda-forge r-stm  # Install STM R package (this may fail, working out dependency conflicts)

# Restart terminal, then start RStudio-Server with these commands:
#sudo gdebi rstudio-server-1.2.1335-amd64.deb
#rm rstudio-server-1.2.1335-amd64.deb
#sudo rstudio-server start

# Now you can login to the VM's RStudio-Server using: VM_IP.jetstream-cloud.org:8787

# To troubleshoot this process, see help here: https://cyverse-ez-quickstart.readthedocs-hosted.com/en/latest/rstudio.html
