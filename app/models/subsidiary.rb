class Subsidiary < ApplicationRecord
  validates :address, length: { in: 5..50 }
  has_many :schedules, dependent: :destroy
  belongs_to :locality
end
