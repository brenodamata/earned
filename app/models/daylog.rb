class Daylog < ApplicationRecord
  has_many :demerit_logs
  DATE_FORMAT = '%Y%m%d'

  def self.to_date_code date
    date = date.to_date unless date.is_a? Date
    date.strftime(DATE_FORMAT).to_i
  end

  def self.from_date_code date_code
    begin
      Date.strptime(date_code.to_s, DATE_FORMAT)
    rescue Exception=>e
      logger.warn "Invalid date #{date_code}"
      raise e
    end
  end

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
