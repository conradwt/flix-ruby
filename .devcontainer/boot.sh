bundle install
yarn install

sudo chown -R vscode:vscode /usr/local/bundle

cd activerecord

# Create PostgreSQL databases
bundle exec rake db:postgresql:rebuild
