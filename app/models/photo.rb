class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :album
  belongs_to :user

  before_validation :set_posted_date

  validates :description, presence: true
  validates :posted_date, presence: true
  validates :image, presence: true, unless: :was_attached?

  private
  
  def was_attached?
    self.image.attached?
  end

  def set_posted_date
    self.posted_date = Date.today if self.posted_date.nil? 
  end
end