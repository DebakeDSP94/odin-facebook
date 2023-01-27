class LikesController < ApplicationController
  def create
    @like = current_member.likes.new(like_params)
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = current_member.likes.find(params[:id])
    @like.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, status: :see_other }
    end
  end

  private

  def like_params
    params.require(:like).permit(:like_id, :likeable_id, :likeable_type)
  end
end
