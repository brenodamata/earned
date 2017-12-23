class Goal < ApplicationRecord
  # TODO: in future goals could be manually inputted, would need spoils/fee fields
  # belongs_to :goal_trigger, optional: true
  belongs_to :goal_trigger
  delegate :metric, to: :goal_trigger

  validates :start_date_code, precense: true
  validates :end_date_code, precense: true

  def open?; succeeded.nil? end
  def closed?; !open? end

  def close amount_reached
    objective = metric.levels[goal_trigger.trigger_level+1][:ammount]
    self.succeeded = (amount_reached >= objective) ? true : false
    result = (amount_reached >= objective) ? goal_trigger.spoils : goal_trigger.fee
    save!
  end

  def result_to_s
    return {error: 'Ongoing objective.'} if open?
    self.succeeded ? "You've earned #{result} coins." : "Cough-up #{result} coins."
  end
end
