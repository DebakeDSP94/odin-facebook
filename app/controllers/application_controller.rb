class ApplicationController < ActionController::Base
  before_action :authenticate_member!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_action

  def store_action
    return unless request.get?
    if (
         request.path != "/members/sign_in" &&
           request.path != "/members/sign_up" &&
           request.path != "/members/password/new" &&
           request.path != "/members/password/edit" &&
           request.path != "/members/confirmation" &&
           request.path != "/members/sign_out" && !request.xhr?
       ) # don't store ajax calls
      store_location_for(:member, posts_path)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_url
  end

  add_flash_types :info, :success, :warning

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[name location employer age link profile]
    )
  end
end
