class Like < ApplicationRecord
  belongs_to :member
  belongs_to :likeable, polymorphic: true, touch: true
end
