class ApplicationController < ActionController::Base
  before_action :authenticate_member!

  add_flash_types :info, :success, :warning
end
