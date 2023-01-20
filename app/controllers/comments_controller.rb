class CommentsController < ApplicationController
  before_action :set_post
  def create
    @comment = @commentable.comments.new comment_params
    @comment.member = current_member
    @comment.post_id = @post["id"]
    @comment.save
    redirect_to @commentable, notice: "Your comment was successfully posted."
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
