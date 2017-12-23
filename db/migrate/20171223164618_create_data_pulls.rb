class CreateDataPulls < ActiveRecord::Migration[5.1]
  def change
    create_table :data_pulls do |t|
      t.references :metric
      t.datetime :start_date
      t.datetime :end_date
      t.string :frequency
      t.integer :priority
      t.boolean :queued, default: true
      t.boolean :processed, default: false
      t.string :error_message

      t.timestamps
    end
  end
end
