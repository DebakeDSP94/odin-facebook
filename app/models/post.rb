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
