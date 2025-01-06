class Album < ApplicationRecord
  validates :text, presence: true
end
