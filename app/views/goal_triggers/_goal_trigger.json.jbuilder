json.extract! goal_trigger, :id, :frequency, :metric_id, :trigger_level, :spoils, :fee, :message, :created_at, :updated_at
json.url goal_trigger_url(goal_trigger, format: :json)
