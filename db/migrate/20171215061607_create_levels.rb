class CreateLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :levels do |t|
      t.references :metric, foreign_key: true
      t.integer :low_amount
      t.string :low_name
      t.integer :medium_low_amount
      t.string :medium_low_name
      t.integer :medium_amount
      t.string :medium_name
      t.integer :medium_high_amount
      t.string :medium_high_name
      t.integer :high_amount
      t.string :high_name

      t.timestamps
    end
  end
end
