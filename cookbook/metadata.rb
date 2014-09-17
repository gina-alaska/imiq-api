name             'imiq_api'
maintainer       'Will Fisher'
maintainer_email 'will@gina.alaska.edu'
license          'All rights reserved'
description      'Installs/Configures imiq_api application server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports "centos", ">= 6.0"

depends "chruby"
depends 'yum-gina'
depends 'yum-epel'
depends "postgresql"
depends 'unicorn'
depends 'nginx'
depends 'java'
depends 'memcached'
depends 'now'
depends 'magic_shell'