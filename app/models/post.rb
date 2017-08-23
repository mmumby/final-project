class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, as: :commentable
  before_validation :victoria_bc

  validates :category, presence: true
  validates :description, length: { in: 10..280,
    too_long: "of %{count} characters is the maximum allowed",
    too_short: "of %{count} characters is the minimum required" }
  validates :title, presence: true, length: { maximum: 40,
    too_long: "of %{count} characters is the maximum allowed" }
  validates :location, presence: true

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  def victoria_bc
    self.location = "#{self.location} Victoria,BC"
  end

end
