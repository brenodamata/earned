class CreateIncentives < ActiveRecord::Migration[5.1]
  def change
    create_table :incentives do |t|
      t.references :metric, foreign_key: true
      t.boolean :merit
      t.integer :threshold
      t.string :equation
      t.integer :coins

      t.timestamps
    end
  end
end
