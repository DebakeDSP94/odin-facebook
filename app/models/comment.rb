# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text
#  commentable_type :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :bigint           not null
#  member_id        :bigint           not null
#
# Indexes
#
#  index_comments_on_commentable  (commentable_type,commentable_id)
#  index_comments_on_member_id    (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :commentable, polymorphic: true, touch: true
  has_many :likes, as: :likeable

  has_rich_text :body
end
