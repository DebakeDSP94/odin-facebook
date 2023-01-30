# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :bigint           not null
#
# Indexes
#
#  index_posts_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Post < ApplicationRecord
  belongs_to :member

  has_rich_text :body
  has_many_attached :images, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable

  def self.recent
    order("updated_at DESC")
  end
end
