class AddIndexToFollowingRecords < ActiveRecord::Migration[5.2]
  def change
    add_index :following_records, :user_id
  end
end
