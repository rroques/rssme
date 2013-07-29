web: bundle exec rails server thin -p $PORT
redis: redis-server
worker: bundle exec rake resque:work QUEUE=*
scheduler: bundle exec rake resque:scheduler
