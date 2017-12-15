class CreateDemeritLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :demerit_logs do |t|
      t.references :demerit, foreign_key: true
      t.references :daylog, foreign_key: true

      t.timestamps
    end
  end
end
