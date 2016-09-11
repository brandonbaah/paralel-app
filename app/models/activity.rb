class Activity < ActiveRecord::Base
  belongs_to :recordable, polymorphic: true
  belongs_to :user
  has_many :comments
end
