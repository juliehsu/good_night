class InsertDefaultRecordsInConfigurations < ActiveRecord::Migration[5.2]
  def change
  	Configuration.find_or_create_by(key: 'session_user_id', value: 1)
  	Configuration.find_or_create_by(key: 'C_prev_dur_start_definition', value: '1.week.ago')
  	Configuration.find_or_create_by(key: 'C_prev_dur_end_definition', value: 'Time.now')
  end
end
