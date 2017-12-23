class CreateMetricLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :metric_logs do |t|
      t.references :metric, foreign_key: true
      t.integer :date_code
      t.string :log_type
      t.decimal :amount

      t.timestamps
    end
  end
end
