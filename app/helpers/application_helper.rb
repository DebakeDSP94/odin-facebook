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

  def nav_items
    [{ url: root_path, title: "Home" }]
  end

  def nav_helper(style = "", tag_type = "")
    nav_links = ""

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type} %>"
    end
    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page? path
  end
end
