class HomepageController < ApplicationController
  def report
  end


  def generate
    MyWorker.perform_async
    # MyWorker.perform_in(1.minute)
    # MyWorker.perform_in(20)
  end

end
