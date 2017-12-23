class AddSourceToMetrics < ActiveRecord::Migration[5.1]
  def change
    add_column :metrics, :source, :string
  end
end
