class User::Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true
  # has_many :user_participants, class_name: "User::Participant", foreign_key: :user_admin_id, inverse_of: :user_admin, dependent: :destroy
  has_many :groups
  has_many :participants, through: :groups
end
