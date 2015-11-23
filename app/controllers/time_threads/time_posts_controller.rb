class TimeThreads::TimePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_thread

  def create
    @time_post = @time_thread.time_posts.new time_post_params
    @time_post.user = current_user

    if @time_post.save
      #@forum_post.send_notifications!
      redirect_to time_thread_path(@time_thread, anchor: "time_post_#{@time_post.id}"), notice: "Successfully posted!"
    else
      redirect_to @time_thread, alert: "Unable to save your post"
    end
  end

  private

    def set_time_thread
      @time_thread = TimeThread.find(params[:time_thread_id])
    end

    def time_post_params
      params.require(:time_post).permit(:month, :day, :minute)
    end
end
