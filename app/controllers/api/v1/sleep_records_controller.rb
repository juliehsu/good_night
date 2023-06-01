class Api::V1::SleepRecordsController < ::Api::ApplicationController
  def index
    sleep_records = current_user.sleep_records.order(created_at: :asc)
    render json: sleep_records
  end

  def clock_in
    sleep_record = current_user.last_active_sleep_record

    if sleep_record.present?
      sleep_record.is_finished = true
    else
      sleep_record = ::SleepRecord.new(user_id: current_user.id)
    end
    sleep_record.save

    render json: sleep_record
  end

  def following_records_during_last_week
    following_user_id = current_user.followings.map(&:followed_id)
    dur_start = ::SleepRecord::DUR_START
    dur_end = ::SleepRecord::DUR_END

    sleep_records = ::SleepRecord.filter_by_dur(dur_start, dur_end).where(user_id: following_user_id)
    render json: sleep_records.sort_by(&:duration).reverse
  end

  def all_records
    # TODO : should set access constraint

    sleep_records = SleepRecord.order(created_at: :asc)
    render json: sleep_records
  end
end
