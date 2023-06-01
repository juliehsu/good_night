class Api::V1::SleepRecordsController < ::Api::ApplicationController
  def index
    sleep_records = current_user.sleep_records.order(created_at: :asc)
    render json: sleep_records
  end

  def clock_in
    # need confirm: how to handle the situation which user forgot clock in while wake up

    sleep_record = current_user.last_active_sleep_record

    if sleep_record.present?
      sleep_record.is_finished = true
    else
      sleep_record = ::SleepRecord.new(user_id: current_user.id)
    end

    if sleep_record.save
      render json: sleep_record
    else
      render json: { result: 'fail', message: 'clock in fail.'}
    end
  end

  def following_records_during_last_week
    following_user_id = current_user.followings.map(&:followed_id)
    dur_start = ::SleepRecord::DUR_START
    dur_end = ::SleepRecord::DUR_END

    sleep_records = ::SleepRecord.filter_by_created_dur(dur_start, dur_end).where(user_id: following_user_id)

    if sleep_records
      render json: sleep_records.sort_by(&:duration).reverse
    else
      render json: { result: 'fail', message: 'list following records fail.'}
    end
  end

  def all_records
    # TODO : should set access constraint

    sleep_records = SleepRecord.order(created_at: :asc)
    render json: sleep_records
  end
end
