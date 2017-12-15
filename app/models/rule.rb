class Rule < ApplicationRecord
  belongs_to :demerit

  validates :name, uniqueness: true
end
