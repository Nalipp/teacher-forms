class TimeThreadsController < ApplicationController

  def index
    @time_threads = TimeThread.all
  end

end
