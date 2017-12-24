# Currently supporing:
#   - Rescuetime:
#       - Profeciency
class DataPull < ApplicationRecord
  belongs_to :metric

  scope :queue, -> { where(processed: false, queued: true) }

  RT_API_KEY = Figaro.env.rescuetime_api_key
  RT_URL = "https://www.rescuetime.com/anapi/data?key=#{RT_API_KEY}"

  def mark_as_done
    self.update_attributes processed: true, queued: false
  end

  def process
    case metric.source
    when 'rescuetime'
      rescuetime
    end
  end

  def rescuetime
    client = Rescuetime::Client.new(api_key: RT_API_KEY)
    client.efficiency.from(rt_date(start_date)).to(rt_date(end_date)).order_by(:time, interval: :day).all.each do |rt|
      date_code = Daylog.to_date_code(rt[:date])
      log = metric.metric_logs.find_or_create_by(log_type: 'daily', date_code: date_code)
      log.update_attributes amount: rt[:efficiency_percent]
    end
  end

  def self.rt uri
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end
    j = JSON.parse(res.body)

    rows = j["rows"].each_with_object([]) do |values, rows|
      row = {}
      j["row_headers"].each_with_index do |key, index|
        row[key] = values[index]
      end
      rows << row
    end
  end

  def self.rt_time_spent date = Date.yesterday
    return "Only dates are accepted as params" unless date.is_a?(String) || date.is_a?(Date)
    date = date.to_s unless date.is_a? String

    rows = DataPull.rt(URI(RT_URL + "&pv=rank&rb=#{date}&re=#{date}&format=json"))
    Time.at(rows.map{|r| r["Time Spent (seconds)"]}.inject(:+)).utc.strftime("%H:%M:%S")
  end

  private

  # param: ActiveSupport::TimeWithZone
  # return: 'YYYY-MM-DD'
  def rt_date datetime
    datetime.to_date.to_s
  end
end
