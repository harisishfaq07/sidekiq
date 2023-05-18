How to implement sidekiq


<!-- Step 1: Add Gems -->
gem 'sidekiq'
gem 'sinatra'

<!-- Step 2: run bundle -->
bundle install

<!-- Step 3: Add route -->
go to: routes.rb

require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  on browser open: localhost:3000/sidekiq

<!-- Step 4: add file -->

create: config/sidekiq.yml

:concurrency: 5
:queues:
  - default


  <!-- Step 5: Add file -->

create: config/initializers/sidekiq.rb

  Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/0' }
end


<!-- Step 6: Create worker class -->

create: app/workers/my_worker.rb

class MyWorker
  include Sidekiq::Worker

  def perform(arg1, arg2)
    # Code to be executed in the background
    # ...
  end
end


<!-- Step 7: Perform processing by calling -->

MyWorker.perform_async(arg1, arg2) #for queue
MyWorker.perform_in(1.hour, arg1, arg2) #for scheduling
MyWorker.perform_at(1.minute,arg1, arg2) #for scheduling
etc

<!-- Step 8: install redis server -->

install redis on your machine by brew install redis | sudo install redis

brew services start redis or  brew services restart redis
redis-cli
write ping it should return pong
start redis server: redis-server


<!-- Step 9: final step to execute the job or process -->
run: bundle exec sidekiq 




