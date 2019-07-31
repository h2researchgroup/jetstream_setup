# -*- coding: UTF-8

#wget https://cran.r-project.org/src/contrib/geometry_0.4.1.tar.gz
#R CMD INSTALL geometry_0.4.1.tar.gz
#wget http://cran.r-project.org/src/contrib/rsvd_1.0.1.tar.gz
#R CMD INSTALL rsvd_1.0.1.tar.gz
#wget https://cran.r-project.org/src/contrib/tidyverse_1.2.1.tar.gz
#R CMD INSTALL tidyverse_1.2.1.tar.gz

# Install the many packages needed for R:
apt-get install libxml2-dev openssl libssl-dev libmariadbclient-dev librsvg2-dev libpoppler-cpp-dev libwebp-dev libmagick++-dev cargo libpq-dev postgresql-common libgsl23 libgsl-dev r-cran-rgl libftgl2 libcgal-dev libglu1-mesa-dev libglu1-mesa-dev libx11-dev libfreetype6-dev

# Write & call function to install R tools:
function install_R_pkgs {
R - <<END
install.packages("curl", dependencies=TRUE)
install.packages("xml2", dependencies=TRUE)
install.packages("devtools", dependencies=TRUE)
install.packages("gsl", dependencies=TRUE)
install.packages("RMySQL", dependencies=TRUE)
install.packages("RPostgreSQL", dependencies=TRUE)
install.packages("geometry", dependencies=TRUE)
install.packages("rsvd", dependencies=TRUE)
install.packages("tidyverse", dependencies=TRUE)
install.packages("dplyr", dependencies=TRUE)
install.packages("topicmodels", dependencies=TRUE)
install.packages("rgl", dependencies=TRUE)
install.packages('ergm', dependencies=TRUE)
library(remotes); install_version("statnet.common", "4.1.4")
install.packages("quanteda", dependencies=TRUE)
install.packages("stm", dependencies=TRUE)
END
}
install_R_pkgs
