# == Schema Information
#
# Table name: friends
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer          not null
#  member_id  :bigint           not null
#
# Indexes
#
#  index_friends_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Friend < ApplicationRecord
  belongs_to :member
  belongs_to :friend, class_name: "Member"
end
