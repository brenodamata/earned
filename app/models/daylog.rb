class Daylog < ApplicationRecord
  has_many :demerit_logs

  def logs
    MetricLog.where(log_type: 'daily', log_id: self.id)
  end

  def demerits
    demerit_logs.map { |log| "#{log.demerit.name}" }
  end

  def close
    self.incentive_total = calculate_incentive_total
    self.strikes = demerit_logs.size
    self.win = demerit_logs.size >= 3 ? false : win
    save!
  end

  def calculate_incentive_total incentive_total = 0
    logs.each do |log|
      incentive_total += log.metric.incentive_total log.amount
    end
    incentive_total
  end

end
