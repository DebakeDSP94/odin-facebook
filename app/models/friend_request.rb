class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "Member"
  belongs_to :receiver, class_name: "Member"
end
