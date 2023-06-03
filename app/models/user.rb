class User < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :sleep_records, dependent: :destroy
  has_many :followings, class_name: "FollowingRecord", foreign_key: 'user_id', dependent: :destroy

  def last_active_sleep_record
  	sleep_records.where("is_finished = false").first
  end

end