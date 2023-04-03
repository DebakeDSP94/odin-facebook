# == Schema Information
#
# Table name: authorizations
#
#  id         :bigint           not null, primary key
#  provider   :string
#  secret     :string
#  token      :string
#  uid        :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer
#
require "test_helper"

class AuthorizationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
