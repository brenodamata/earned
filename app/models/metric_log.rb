class MetricLog < ApplicationRecord
  belongs_to :metric

  def log
    case metric.frequency_type
    when :daily
      Daylog.find(log_id)
    else # :weekly
      Weeklog.find(log_id)
    end
  end
end
