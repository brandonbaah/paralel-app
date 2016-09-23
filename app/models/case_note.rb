class CaseNote < ApplicationRecord
  belongs_to :client
  has_many :activities, as: :recordable
end
