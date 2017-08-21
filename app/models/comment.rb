class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: true, length: { maximum: 140,
    too_long: "%{count} character is the maximum allowed" }

end
