class AddIndexToConfigurations < ActiveRecord::Migration[5.2]
  def change
    add_index :configurations, :key, unique: true
  end
end
