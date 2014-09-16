name             'imiq_api'
maintainer       'Will Fisher'
maintainer_email 'will@gina.alaska.edu'
license          'All rights reserved'
description      'Installs/Configures imiq_api application server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports "centos", ">= 6.0"

depends "chruby"
depends "npm"
depends "user"
depends "application_ruby"
depends "gina", "~> 0.4.5"
depends "postgresql"
depends "gina-postgresql"
depends "nginx"