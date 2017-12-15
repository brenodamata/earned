class Demerit < ApplicationRecord
  validates :name, uniqueness: true
end
