class CreateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :relations do |t|
      t.integer :user_id, null: false
      t.integer :followed_id, null: false

      t.timestamps
    end
  end
end
