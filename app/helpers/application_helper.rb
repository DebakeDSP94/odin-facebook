module ApplicationHelper
  def login_helper(style = "")
    if !member_signed_in?
      link_to("Register", new_member_registration_path, class: "navbar-item") +
        " ".html_safe +
        link_to("Login", new_member_session_path, class: "navbar-item")
    else
      link_to(
        "Logout",
        destroy_member_session_path,
        data: {
          turbo_method: :delete,
        },
        class: "navbar-item",
      )
    end
  end

  def active?(path)
    "active" if current_page?(path)
  end

  def flash_class(level)
    case level.to_sym
    when :notice
      "notification is-primary"
    when :success
      "notification is-success"
    when :alert
      "notification is-warning"
    when :error
      "notification is-danger"
    else
      "notification is-info"
    end
  end

  def copyright_generator
    WilsonViewTool::Renderer.copyright("Stuart Wilson", "All rights reserved")
  end

  def profile_helper(member)
    unless member.profile.file.nil?
      image_tag(
        member.profile.to_s,
        width: 60,
        height: 60,
        style: "border-radius: 50%",
      ).html_safe
    else
      gravatar_helper(member)
    end
  end

  def gravatar_helper(member)
    image_tag(
      "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(member.email.downcase)}",
      width: 60,
      height: 60,
      style: "border-radius: 50%;",
    )
  end
end
