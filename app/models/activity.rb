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
    if recordable_type == "Client"
      client_name = recordable.name
    else
      client_name = recordable.client.name
    end
  end
  def channel_id
    if recordable_type == "Client"
      client_id = recordable.id
    else
      client_id = recordable.client_id
  end
end
end
