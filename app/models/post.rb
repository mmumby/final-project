class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable

  validates :category, presence: true

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

end
