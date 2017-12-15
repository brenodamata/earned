class DemeritLog < ApplicationRecord
  belongs_to :demerit
  belongs_to :daylog
end
