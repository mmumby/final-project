class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :content, presence: true, length: { maximum: 140,
    too_long: "%{count} character is the maximum allowed" }

end
