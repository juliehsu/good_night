class Api::V1::SleepRecordsController < ::Api::ApplicationController
  def index
    sleep_records = current_user.sleep_records.order(created_at: :asc)
    render json: sleep_records
  end

  def clock_in
    sleep_record = SleepRecord.last_active_record(current_user.id).last
    if sleep_record.present?
      sleep_record.is_finished = true
    else
      sleep_record = SleepRecord.new(user_id: current_user.id)
    end
    sleep_record.save

    render json: sleep_record
  end

  def following_records_during_last_week
    following_user_id = current_user.followings.map(&:followed_id)
    sleep_records = SleepRecord.where(user_id: following_user_id).where("created_at >= ?", 1.week.ago)
    render json: sleep_records.sort_by(&:duration).reverse
  end
end
