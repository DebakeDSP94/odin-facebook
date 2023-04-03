# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_member)
# CommentNotification.with(post: @post).deliver(current_member)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  def to_database
    {
      type: self.class.name,
      params: params,
    }
  end

  param :comment

  # Define helper methods to make rendering easier.
  #
  def message
    @post = Post.find(params[:comment][:commentable_id])
    @comment = Comment.find(params[:comment][:id])
    @member = Member.find(@comment.member_id)
    "#{@member.email} commented on your post"
  end

  def url
    post_path(Post.find(params[:comment][:commentable_id]))
  end
end
