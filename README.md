Hello, Nikita
=============

This is your university project. Enjoy.


So, How to run this app
-----------------------


### 1) install rvm
    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
    source ~/.bash_profile # reload env
    rvm requirements # then follow the instructions
    rvm install 1.9.3 # install ruby
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
    source ~/.bash_profile
    type rvm | head -1 # should see "rvm is a function"


### 2) install mysql
    sudo apt-get  install libmysql-ruby libmysqlclient-dev mysql-client mysql-server


### 3) install node.js
    sudo apt-get install python-software-properties
    sudo add-apt-repository ppa:chris-lea/node.js
    sudo apt-get update
    sudo apt-get install nodejs
    sudo apt-get install nodejs-dev


###4) run server
    cd some_path/university
    bundle install # install gems
    rake db:create # create database
    reke db:migrate # run migrations
    rake db:seed # populate with data
    rails s # run server