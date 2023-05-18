class MyWorker
    include Sidekiq::Worker
    def perform
      Article.destroy_all
    end
end