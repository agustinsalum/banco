class AddIndexToTurns < ActiveRecord::Migration[7.0]
  def change
    add_index :turns, [:turn_date, :hour, :user_client_id], unique: true
  end
end
