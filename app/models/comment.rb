class Comment < ApplicationRecord
  belongs_to :activities
  belongs_to :user
end
