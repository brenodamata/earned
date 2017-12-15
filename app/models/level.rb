class Level < ApplicationRecord
  belongs_to :entity, polymorphic: true

  def level_by_code code
    case code
    when 1
      {name: low_name, amount: low_amount}
    when 2
      {name: medium_low_name, amount: medium_low_amount}
    when 3
      {name: medium_name, amount: medium_amount}
    when 4
      {name: medium_high_name, amount: medium_high_amount}
    when 5
      {name: high_name, amount: high_amount}
    else
      {error: 'Levels are 1-5'}
    end
  end
end
