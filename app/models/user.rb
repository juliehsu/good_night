class User < ApplicationRecord
	# TODO : should add index in table
	# TODO : should add uniq constraint

  validates :name, presence: true

  has_many :sleep_records
  has_many :followings, class_name: "FollowingRecord"

end