class User < ApplicationRecord
  self.per_page = 4 # Cantidad de turnos por pagina
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # Campos adicionales
  enum role: { administrador: 1, empleado_bancario: 2, cliente: 3 } 
  validates :name, presence: true # Rol por defecto 3
  belongs_to :subsidiary, optional: true
  has_many :my_turns, class_name: :Turn, foreign_key: :user_client, dependent: :destroy
  has_many :shift_attention, class_name: :Turn, foreign_key: :user_bank
end
