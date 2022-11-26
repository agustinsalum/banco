class AddIndexToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_index :schedules, [:day_week, :subsidiary_id], unique: true
  end
end
