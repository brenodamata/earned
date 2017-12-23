class GoalTrigger < ApplicationRecord
  belongs_to :metric

  validates :trigger_level, numericality: {greater_than: 0, less_than: 5}

  FREQUENCY_TYPE = {
    'd' => :daily,
    'w' => :weekly,
    'm' => :monthly
  }
end
