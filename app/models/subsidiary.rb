class Subsidiary < ApplicationRecord
  self.per_page = 4 # Cantidad de sucursales por pagina
  validates :name_subsidiary, uniqueness: true, presence: true
  validates :address, length: { in: 5..50 }
  has_many :schedules, dependent: :destroy
  has_many :turns, dependent: :destroy
  has_many :users, dependent: :destroy
  belongs_to :locality
end
