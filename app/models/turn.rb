class Turn < ApplicationRecord
  self.per_page = 2 # Cantidad de turnos por pagina
  validates :reason_turn, :turn_date, :hour, :state, presence: true
  validates :comment, presence: false
  validates :turn_date, :hour, uniqueness: { scope: :subsidiary_id }
  belongs_to :subsidiary
  belongs_to :user_client, class_name: :User
  belongs_to :user_bank, class_name: :User, optional: true
end
