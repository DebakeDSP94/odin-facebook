class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :commentable, polymorphic: true

  has_rich_text :comment
end
