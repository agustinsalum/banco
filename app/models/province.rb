class Province < ApplicationRecord
    validates :name_province, uniqueness: true, presence: true
    has_many :localities, dependent: :destroy
end
