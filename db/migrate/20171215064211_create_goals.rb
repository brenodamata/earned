class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.references :goal_trigger, foreign_key: true
      t.integer :start_date_code
      t.integer :end_date_code
      t.boolean :succeeded, default: nil
      t.integer :result

      t.timestamps
    end
  end
end
