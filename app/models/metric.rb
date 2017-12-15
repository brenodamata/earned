class Metric < ApplicationRecord
  has_many :metric_logs
  has_many :incentives

  validates :name, uniqueness: true

  FREQUENCY_TYPE = {
    0 => :daily,
    1 => :weekly
  }

  def frequency_type
    FREQUENCY_TYPE[frequency]
  end
end
