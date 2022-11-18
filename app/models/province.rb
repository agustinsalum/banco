class Province < ApplicationRecord
    validates :name_province, presence: true
    has_many :localities, dependent: :destroy
end
