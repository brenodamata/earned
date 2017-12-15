class Incentive < ApplicationRecord
  belongs_to :metric

  EQUATION_TYPES = ['>=', '>', '<=', '<']

  def to_s
    "#{equation} than #{threshold} #{metric.unit_of_measure} #{merit ? 'earns' : 'is penalized with'} #{coins} coins."
  end
end
