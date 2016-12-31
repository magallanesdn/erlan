class AddItemToControls < ActiveRecord::Migration[5.0]
  def change
    add_column :controls, :item, :string
  end
end
