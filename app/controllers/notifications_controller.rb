class NotificationsController < ApplicationController
  before_action :set_member
  before_action :set_commentable

  def index
    if @member
      @notifications = Notification.where(recipient: current_member)
    end
  end

  private

  def set_member
    @member = Member.find_by(params[:id])
  end

  def set_commentable
    @commentable = Post.find_by(params[:post_id])
  end
end
