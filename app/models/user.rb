class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Campos adicionales
  enum role: { administrador: 1, empleado_bancario: 2, cliente: 3 } 
  validates :name, :role, presence: true # Rol por defecto 3
  belongs_to :subsidiary, optional: true
  has_many :user_client, class_name: :Turn, foreign_key: :user_client
  has_many :user_bank, class_name: :Turn, foreign_key: :user_bank
end
