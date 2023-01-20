module PostsHelper
  def gravatar_helper(user)
    image_tag "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}",
              width: 60
  end
end
