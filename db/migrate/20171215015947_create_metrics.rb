class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :unit_of_measure
      t.integer :frequency

      t.timestamps
    end
  end
end
