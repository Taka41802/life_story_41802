class Comment < ApplicationRecord
  belongs_to :user, optional: false
  belongs_to :photo
end
