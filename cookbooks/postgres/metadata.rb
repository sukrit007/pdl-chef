maintainer       "Pearson"
maintainer_email "sukrit.khera@pearson.com"
license          "All rights reserved"
description      "Installs/Configures postgres"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
supports "centos" 
recipe "postgres::install","Install PostgreSQL Server"  