class Turn < ApplicationRecord
  validates :reason_turn, presence: true
  validates :comment, presence: false
  belongs_to :subsidiary
  belongs_to :user_client, class_name: :User
  belongs_to :user_bank, class_name: :User, optional: true
end
