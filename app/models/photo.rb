class Photo < ApplicationRecord
  belongs_to :album
  belongs_to :user

  before_create :set_posted_date

  private

  def set_posted_date
    self.posted_date = Date.today
  end
end