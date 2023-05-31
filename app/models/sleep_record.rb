class SleepRecord < ApplicationRecord
	# TODO : should add index in table
	# TODO : should add uniq constraint
  belongs_to :user
  scope :last_active_record, -> (user_id) {where(["user_id = ? AND is_finished = false", user_id])}

  def duration
  	updated_at - created_at
  end
end
