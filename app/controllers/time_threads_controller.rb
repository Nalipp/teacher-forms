class TimeThreadsController < ApplicationController
  before_action :set_time_thread, except: [:index, :new, :create]

  def index
    @time_threads = TimeThread.all
  end

  def show
  end

  def new
    @time_thread = TimeThread.new
  end

  def create
    @time_thread = TimeThread.new(time_thread_params)

    if @time_thread.save
      redirect_to @time_thread
    else
      render 'new'
    end
  end

  private

    def set_time_thread
      @time_thread = TimeThread.find(params[:id])
    end

    def time_thread_params
      params.require(:time_thread).permit(:student_name)
    #  params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    #  params.require(:article).permit(:title, :description)
    end
end
