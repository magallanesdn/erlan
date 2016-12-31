class AddStockToControls < ActiveRecord::Migration[5.0]
  def change
    add_column :controls, :stock, :integer
  end
end
