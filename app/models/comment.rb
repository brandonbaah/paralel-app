class Comment < ActiveRecord::Base
  belongs_to :activities
  belongs_to :user
end
