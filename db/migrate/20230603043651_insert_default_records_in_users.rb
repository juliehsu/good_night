class InsertDefaultRecordsInUsers < ActiveRecord::Migration[5.2]
  def up
  	User.find_or_create_by(name: 'julie')
  	User.find_or_create_by(name: 'aya')
  	User.find_or_create_by(name: 'elsa')
  	User.find_or_create_by(name: 'sleeping_beauty')
  end

  def down
  	User.find_by(name: 'julie').destroy
  	User.find_by(name: 'aya').destroy
  	User.find_by(name: 'elsa').destroy
  	User.find_by(name: 'sleeping_beauty').destroy
  end
end
