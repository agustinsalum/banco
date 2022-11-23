class RemoveHourFromSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedules, :hour, :time
  end
end
