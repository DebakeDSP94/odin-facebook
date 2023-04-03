# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint
#  member_id     :bigint           not null
#
# Indexes
#
#  index_likes_on_likeable                                     (likeable_type,likeable_id)
#  index_likes_on_member_id                                    (member_id)
#  index_likes_on_member_id_and_likeable_type_and_likeable_id  (member_id,likeable_type,likeable_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Like < ApplicationRecord
  belongs_to :member
  belongs_to :likeable, polymorphic: true, touch: true

  has_noticed_notifications
end
