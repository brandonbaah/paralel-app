class CheckList < ApplicationRecord
  belongs_to :user
  belongs_to :client
  has_many :activities, as: :recordable
end
