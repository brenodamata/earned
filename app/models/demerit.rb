class Demerit < ApplicationRecord
  validates :name, uniqueness: true

  has_many :demerit_logs
end
