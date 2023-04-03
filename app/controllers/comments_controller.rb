class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy like]
  before_action :set_commentable, only: %i[index new create]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.member = current_member
    puts(params)
    if @comment.save
      redirect_to(
        posts_path(@commentable),
        flash: {
          success: "Your comment was successfully created.",
        },
      )
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @commentable = @comment.commentable
    flash[:success] = "Comment deleted" if @comment.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url, status: :see_other) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable, :post_id, :like)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_commentable
    @commentable = Post.find(params[:post_id])
  end
end
