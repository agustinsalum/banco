class Locality < ApplicationRecord
  #validates :name_locality, uniqueness: true, presence: true
  self.per_page = 4 # Cantidad de localidades por pagina
  validates :name_locality, uniqueness: { scope: :province_id }
  has_many :subsidiaries, dependent: :destroy
  belongs_to :province


end
