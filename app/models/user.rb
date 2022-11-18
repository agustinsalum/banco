class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Campos adicionales
  validates :name, :role, presence: true
  belongs_to :subsidiary
  has_many :user_client, class_name: :Turn, foreign_key: :user_client
  has_many :user_bank, class_name: :Turn, foreign_key: :user_bank
end
