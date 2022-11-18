class Locality < ApplicationRecord
  validates :name_locality, presence: true
  has_many :subsidiariaries, dependent: :destroy
  belongs_to :province
end
