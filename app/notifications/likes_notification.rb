# To deliver this notification:
#
# LikesNotification.with(post: @post).deliver_later(current_user)
# LikesNotification.with(post: @post).deliver(current_user)

class LikesNotification < Noticed::Base
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
      member: Current.member,
    }
  end

  param :post, :comment, :like

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end

  def url
    post_path(params[:post, :comment, :like])
  end
end
