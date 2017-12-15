class CreateMetricLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_logs do |t|
      t.references :metric, foreign_key: true
      t.string :log_type
      t.integer :log_id
      t.integer :amount

      t.timestamps
    end
  end
end
