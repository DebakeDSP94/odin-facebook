# == Schema Information
#
# Table name: friend_requests
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  request_receiver_id :bigint
#  request_sender_id   :bigint
#
# Indexes
#
#  index_friend_requests_on_request_receiver_id  (request_receiver_id)
#  index_friend_requests_on_request_sender_id    (request_sender_id)
#
# Foreign Keys
#
#  fk_rails_...  (request_receiver_id => members.id)
#  fk_rails_...  (request_sender_id => members.id)
#
require "test_helper"

class FriendRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
