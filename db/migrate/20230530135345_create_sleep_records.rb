class CreateSleepRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :sleep_records do |t|
    	t.date :shift_date, null: false
      t.integer :user_id, null: false
      t.boolean :is_finished, default: false

      t.timestamps
    end
  end
end
