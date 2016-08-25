class CaseNote < ActiveRecord::Base
  belongs_to :client
  has_many :activities, as: :recordable
end
