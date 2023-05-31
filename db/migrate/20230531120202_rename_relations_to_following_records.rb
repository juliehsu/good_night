class RenameRelationsToFollowingRecords < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :relations, :following_records
  end

  def self.down
    rename_table :following_records, :relations
  end
end
