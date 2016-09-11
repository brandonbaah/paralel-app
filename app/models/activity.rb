class Activity < ActiveRecord::Base
  belongs_to :recordable, polymorphic: true
  belongs_to :user
  has many :comments
end
