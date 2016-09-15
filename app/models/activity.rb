class Activity < ActiveRecord::Base
  belongs_to :recordable, polymorphic: true
  belongs_to :user
  has_many :comments

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
end
