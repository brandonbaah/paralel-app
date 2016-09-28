class Client < ApplicationRecord
  has_many :check_lists
  belongs_to :user
  has_many :case_notes
  has_many :activities, as: :recordable

  geocoded_by :address
  after_validation :geocode

  def visits
    @clients = Client.where(user_id: current_user.id, visit_today: true)
  end

  def uncompleted_tasks
    @uncompleted_tasks = CheckList.where(user_id: current_user.id, complete: false).length
  end

  def tasks
    @tasks = CheckList.where(user_id: current_user.id, complete: false)
  end

  def percentage
    @percentage = (CheckList.where(user_id: user.id, complete: true).length.to_f / user.check_lists.length.to_f) * 100
  end
end
