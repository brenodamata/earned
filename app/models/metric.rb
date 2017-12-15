class Metric < ApplicationRecord
  has_many :metric_logs
  has_many :incentives

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
end
