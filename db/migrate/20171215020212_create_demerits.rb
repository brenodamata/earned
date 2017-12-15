class CreateDemerits < ActiveRecord::Migration[5.1]
  def change
    create_table :demerits do |t|
      t.string :name

      t.timestamps
    end
  end
end
