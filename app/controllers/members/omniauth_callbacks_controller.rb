# frozen_string_literal: true
class Members::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_member!

  def all
    member = Member.from_omniauth(request.env["omniauth.auth"], current_member)
    if member.persisted?
      flash[:notice] = "you are successfully logged in!!"
      sign_in_and_redirect(member)
    else
      session["devise.member_attributes"] = member.attributes
      puts member.errors.full_messages

      redirect_to(new_user_registration_url)
    end
  end

  def failure
    super
  end

  alias_method :facebook, :all
  alias_method :github, :all
  alias_method :google_oauth2, :all
end
# More info at:
# https://github.com/heartcombo/devise#omniauth

# GET|POST /resource/auth/twitter
# def passthru
#   super
# end

# GET|POST /users/auth/twitter/callback
# def failure
#   super
# end

# protected

# The path used when OmniAuth fails
# def after_omniauth_failure_path_for(scope)
#   super(scope)
# end
