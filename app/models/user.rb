class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :check_lists
  has_many :clients
  belongs_to :role
  has_many :activities, as: :recordable

  has_many :managers, class_name: "User",
                          foreign_key: "supervisor_id"

  belongs_to :supervisor, class_name: "User"

  has_many :supervisors, class_name: "User",
                          foreign_key: "director_id"

  belongs_to :director, class_name: "User"
end
