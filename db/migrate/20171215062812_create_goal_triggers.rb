class CreateGoalTriggers < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_triggers do |t|
      t.string :frequency
      t.references :metric, foreign_key: true
      t.integer :trigger_level
      t.integer :spoils
      t.integer :fee
      t.text :message

      t.timestamps
    end
  end
end
