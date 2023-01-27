class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.recent.with_rich_text_body_and_embeds.all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.member_id = current_member.id

    respond_to do |format|
      if @post.save
        format.html do
          redirect_to post_url(@post), success: "Post was successfully created"
        end
      else
        flash[:danger] = "Post must have some content."
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html do
          redirect_to post_url(@post), success: "Post was successfully updated"
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, status: :see_other }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:member_id, :body, images: [])
  end
end
