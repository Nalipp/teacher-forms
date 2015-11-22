class TimeThreads::TimePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_time_thread

  def create
    @time_post = @time_thread.time_posts.new time_post_params
    @time_post.user = current_user

    if @time_thread.save
      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Successfully posted!"
    else
      render action: :new
    end
  end

  private

    def set_time_thread
      @time_thread = TimeThread.find(params[:time_thread_id])
    end
end
