maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures test"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe "test::default","Test Recipe"  

# Required Input #
attribute "haproxy/action",
   :display_name => "HAProxy Action",
   :description => "Action :install :remove etc",
   :required => "required",
   :choice => [":install",":remove"],
   :default => [":install"],
   :recipes => ["test::default"]
