class User < ApplicationRecord
	# TODO : should add index in table
	# TODO : should add uniq constraint

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :sleep_records
  has_many :followings, class_name: "FollowingRecord", foreign_key: 'user_id'

  def last_active_sleep_record
  	sleep_records.where("is_finished = false").first
  end

end