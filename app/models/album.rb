class Album < ApplicationRecord
  validates :title, presence: true
  validates :photos, presence: true
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many_attached :photos
end
