class RemoveShiftDateInSleepRecords < ActiveRecord::Migration[5.2]
  def change
  	remove_column :sleep_records, :shift_date
  end
end
