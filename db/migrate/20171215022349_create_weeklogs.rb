class CreateWeeklogs < ActiveRecord::Migration[5.1]
  def change
    create_table :weeklogs do |t|
      t.integer :start_date_code
      t.integer :end_date_code
      t.integer :weekly_incentive
      t.integer :incentive_total
      t.integer :wins
      t.integer :losses

      t.timestamps
    end
  end
end
