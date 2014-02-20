## API Endpoints

## Requirements
* Ruby 2.0
* Rails 4.0.3
* PostgreSQL
* Java (if running solr server)

## Installation

### Rails Setup
    git clone <repo>
    bundle
    cp config/database.yml.example config/database.yml
    cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb
    vim config/database.yml #add the appropriate values
    # start up the server / browser
    rails server
    # setup the database
    rake db:setup
    # seed data into the database
    rake db:seed

### Solr Setup

    # start the solr client 
    bundle exec rake sunspot:solr:start
    # reindex the database (only required the first time you start up solr)
    bundle exec rake sunspot:reindex
    # profit!
