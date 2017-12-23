class Metric < ApplicationRecord
  has_many :metric_logs
  has_many :incentives
  has_many :data_pulls
  has_many :goal_triggers
  has_one :level

  validates :name, uniqueness: true

  scope :daily, -> { where(frequency: 0) }
  scope :weekly, -> { where(frequency: 1) }

  FREQUENCY_TYPE = {
    0 => :daily,
    1 => :weekly
  }

  def frequency_type
    FREQUENCY_TYPE[frequency]
  end

  def incentives_reached amount
    incentives.select do |incentive|
      case incentive.equation
      when '>='
        amount >= incentive.threshold
      when '>'
        amount > incentive.threshold
      when '<='
        amount <= incentive.threshold
      when '<'
        amount < incentive.threshold
      end
    end
  end

  def incentive_total amount
    total = 0
    incentives_reached(amount).each do |incentive|
      total = incentive.merit ? total + incentive.coins : total - incentive.coins
    end
    total
  end

  def levels
    return nil if level.nil?
    {
      1 => level[:low_amount],
      2 => level[:medium_low_amount],
      3 => level[:medium_amount],
      4 => level[:medium_high_amount],
      5 => level[:high_amount]
    }
  end

  def levels_names
    {
      level[:low_name] => level[:low_amount],
      level[:medium_low_name] => level[:medium_low_amount],
      level[:medium_name] => level[:medium_amount],
      level[:medium_high_name] => level[:medium_high_amount],
      level[:high_name] => level[:high_amount]
    }
  end

  # expects:
  #  1: {name: 'name', amount: amount]
  # default names: 'terrible', 'poor', 'ok', 'good', 'great'
  # {1=>{amount: 2000}, 2=>{amount: 4000}, 3=>{amount: 9000}, 4=>{amount: 9000}, 5=>{amount: 12000}}
  def create_levels params
    opts = {
      metric_id: self.id,
      low_name: (params[1][:name].nil? ? 'terrible' : params[1][:name]),
      low_amount: params[1][:amount],
      medium_low_name: (params[2][:name].nil? ? 'poor' : params[2][:name]),
      medium_low_amount: params[2][:amount],
      medium_name: (params[3][:name].nil? ? 'ok' : params[3][:name]),
      medium_amount: params[3][:amount],
      medium_high_name: (params[4][:name].nil? ? 'good' : params[4][:name]),
      medium_high_amount: params[4][:amount],
      high_name: (params[5][:name].nil? ? 'great' : params[5][:name]),
      high_amount: params[5][:amount]
    }
    Level.create(opts)
  end

  def weekday_avg start_date=nil, end_date=nil
    sdc = Daylog.to_date_code(start_date)
    edc = Daylog.to_date_code(end_date)
    logs = metric_logs.where('date_code BETWEEN ? AND ?', sdc, edc).each_with_object([]) do |log, total|
      if Daylog.from_date_code(log.date_code).wday < 6
        total << log.amount
      end
    end
    (logs.inject(:+) / logs.size.to_f).round(2).to_f
  end
end
