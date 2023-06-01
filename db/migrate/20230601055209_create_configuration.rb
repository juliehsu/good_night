class CreateConfiguration < ActiveRecord::Migration[5.2]
  def change
    create_table :configurations do |t|
    	t.string :key
    	t.string :value
    	t.string :description

    	t.timestamps
    end
  end
end
