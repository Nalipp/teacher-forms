class TimeThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_time_thread, except: [:index, :new, :create]

  def index
    @q = TimeThread.search(params[:q])
    @time_threads = @q.result(distinct: true)
  end

  def show
    @time_post = TimePost.new
  end

  def new
    @time_thread = TimeThread.new
    @time_thread.time_posts.new
  end

  def create
    @time_thread = current_user.time_threads.new time_thread_params
    #@time_thread.time_posts.first.user_id = current_user.id

    if @time_thread.save
      redirect_to @time_thread
    else
      render action: :new
    end
  end

  private

    def set_time_thread
      @time_thread = TimeThread.find(params[:id])
    end

    def time_thread_params
      params.require(:time_thread).permit(:student_name, time_posts_attributes: [:month, :day, :minute])
    end
end
