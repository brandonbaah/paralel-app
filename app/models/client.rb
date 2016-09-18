class Client < ActiveRecord::Base
  has_many :check_lists
  belongs_to :user
  has_many :case_notes
  has_many :activities, as: :recordable

  geocoded_by :address
  after_validation :geocode
end
