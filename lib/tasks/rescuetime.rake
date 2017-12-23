namespace :rescuetime do
  desc "TODO"
  task fetch_score: :environment do
    data = DataPull.queue.first # ready to be processed, contains filters to be used like metric, date range, source (rescuetime)

    metric = Metric.find(data.metric_id)
    case metric.source
    when 'rescuetime'
      data.rescuetime
    end
    # Done
    data.mark_as_done
  end

end
