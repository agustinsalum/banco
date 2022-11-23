class AddSinceAndUntilFromSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :hour_since, :time
    add_column :schedules, :hour_until, :time
    add_column :schedules, :schedule_date, :datetime
  end
end
