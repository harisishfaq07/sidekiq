class HomepageController < ApplicationController
  def report
  end


  def generate
    # MyWorker.perform_async
    MyWorker.perform_in(30)
    # MyWorker.perform_in(20)
  end

end
