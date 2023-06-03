class SleepRecord < ApplicationRecord
	#==================================================================================
	# use following text to setup duration start/end in configurations:
	# current_time => 'Time.now'
	# one week ago => '1.week.ago'
	# the nearest Mon. => Date.today.prev_occurring(:monday) 
	# the previous Mon. => Date.today.prev_occurring(:sunday).advance(weeks: -1) + 1.day
	# the nearest Sun. => Date.today.prev_occurring(:sunday)
	# the nearest Sat. => Date.today.prev_occurring(:saturday)
	#==================================================================================
  belongs_to :user
  scope :filter_by_created_dur, -> (s, e) {where("created_at BETWEEN ? AND ? ", s, e)}

  def duration
  	updated_at - created_at
  end
end
