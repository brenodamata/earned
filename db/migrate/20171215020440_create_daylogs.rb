class CreateDaylogs < ActiveRecord::Migration[5.1]
  def change
    create_table :daylogs do |t|
      t.integer :date_code
      t.integer :incentive_total
      t.integer :strikes
      t.boolean :win

      t.timestamps
    end
  end
end
