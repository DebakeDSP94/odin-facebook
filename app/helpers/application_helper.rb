module ApplicationHelper
  def login_helper(style = "")
    if !member_signed_in?
      (link_to "Register", new_member_registration_path, class: style) +
        " ".html_safe + (link_to "Login", new_member_session_path, class: style)
    else
      link_to "Logout",
              destroy_member_session_path,
              data: {
                turbo_method: :delete
              },
              class: style
    end
  end

  def active?(path)
    "active" if current_page? path
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
    WilsonViewTool::Renderer.copyright "Stuart Wilson", "All rights reserved"
  end
end
