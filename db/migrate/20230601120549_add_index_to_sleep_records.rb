class AddIndexToSleepRecords < ActiveRecord::Migration[5.2]
  def change
    add_index :sleep_records, :user_id
  end
end
