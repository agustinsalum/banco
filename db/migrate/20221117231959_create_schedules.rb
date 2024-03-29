class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :day_week
      t.time :hour_since
      t.time :hour_until
      t.references :subsidiary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
