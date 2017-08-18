class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable

  validates :category, presence: true
  validates :description, length: { in: 40..280,
    too_long: "%{count} character is the maximum allowed",
    too_short: "%{count} character is the minimum required" }
  validates :title, presence: true, length: { maximum: 40,
    too_long: "%{count} character is the maximum allowed" }
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

end
