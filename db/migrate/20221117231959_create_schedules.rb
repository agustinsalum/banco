class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :day_week
      t.time :hour_since
      t.time :hour_until
      t.datetime :schedule_date
      t.references :subsidiary, null: false, foreign_key: true

      t.timestamps
    end
    add_index :schedules, [:day_week, :subsidiary_id], unique: true
  end
end
