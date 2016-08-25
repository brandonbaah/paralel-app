class Client < ActiveRecord::Base
  belongs_to :user
  has_many :case_notes
  has_many :activities, as: :recordable
end
