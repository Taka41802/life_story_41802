class Photo < ApplicationRecord
  has_one_attached :images
  belongs_to :album
  belongs_to :user
  has_many :comments, dependent: :destroy

  before_validation :set_posted_date

  validates :posted_date, presence: true
  validates :images, presence: true

  private
  
  def was_attached?
    self.image.attached?
  end

  def set_posted_date
    self.posted_date = Date.today if self.posted_date.nil? 
  end
end