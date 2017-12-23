# Currently supporing:
#   - Rescuetime:
#       - Profeciency
class DataPull < ApplicationRecord
  belongs_to :metric

  scope :queue, -> { where(processed: false, queued: true) }

  def mark_as_done
    self.update_attributes processed: true, queued: false
  end

  def process
    case metric.source
    when 'rescuetime'
      rescuetime
    end
  end

  def rescuetime
    client = Rescuetime::Client.new(api_key: Figaro.env.rescuetime_api_key)
    client.efficiency.from(rt_date(start_date)).to(rt_date(end_date)).order_by(:time, interval: :day).all.each do |rt|
      date_code = Daylog.to_date_code(rt[:date])
      log = metric.metric_logs.find_or_create_by(log_type: 'daily', date_code: date_code)
      log.update_attributes amount: rt[:efficiency_percent]
    end
  end

  private

  # param: ActiveSupport::TimeWithZone
  # return: 'YYYY-MM-DD'
  def rt_date datetime
    datetime.to_date.to_s
  end
end
