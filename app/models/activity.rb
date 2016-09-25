class Activity < ApplicationRecord
  belongs_to :recordable, polymorphic: true
  belongs_to :user
  has_many :comments
  belongs_to :check_list
  belongs_to :client
  belongs_to :post
  def display_text
    if recordable_type == "User"
      return recordable.email
    elsif recordable_type == "Post"
      return recordable.text
    elsif recordable_type == "CaseNote"
      return recordable.client.name
    elsif recordable_type == "Client"
      return recordable.name
    else recordable_type == "CheckList"
      return recordable.goal
    end
  end

  def channel_name
    if action.recordable_type == "Client"
      client_name = action.recordable.name
    else
      client_name = action.recordable.client.name
    end
  end
  def channel_id
    if action.recordable_type == "Client"
      client_id = action.recordable.id
    else
      client_id = action.recordable.client_id
  end
end
end
