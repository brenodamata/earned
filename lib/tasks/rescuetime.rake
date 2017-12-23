namespace :rescuetime do
  desc "TODO"
  task fetch_score: :environment do
    @client = Rescuetime::Client.new(api_key: Figaro.env.rescuetime_api_key)
    metric = Metric.find_by(name: 'RescueTime Score')

    if metric
      @client.efficiency.from('2016-12-20').to('2017-12-20').order_by(:time, interval: :day).all.each do |rt|
        date_code = Daylog.to_date_code(rt[:date])
        log = metric.metric_logs.find_or_create_by(log_type: 'daily', date_code: date_code)
        log.update_attributes amount: rt[:efficiency_percent]
      end
    end
  end

end
