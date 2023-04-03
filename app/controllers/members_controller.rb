class MembersController < ApplicationController
  before_action :set_member

  def show
  end

  def index
    @members = Member.all
    @member = current_member
  end

  private

  def set_member
    @member = Member.find_by(params[:id])
  end

  def member_params
    params.require(:member).permit(
      %i[email name age location employer link profile],
    )
  end
end
