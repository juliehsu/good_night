class User < ApplicationRecord
  validates :name, presence: true

  has_many :sleep_records
  has_many :followings, class_name: "FollowingRecord"

end