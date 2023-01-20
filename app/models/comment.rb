class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :commentable, polymorphic: true, touch: true

  has_rich_text :body
end
