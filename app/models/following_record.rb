class FollowingRecord < ApplicationRecord
	# TODO : should add index in table
	# TODO : should add uniq constraint
	
	belongs_to :user
	belongs_to :followed, class_name: "User", :foreign_key => "followed_id"

  validates :user_id, presence: true
  validates :followed_id, presence: true
end
