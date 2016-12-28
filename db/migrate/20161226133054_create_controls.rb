class CreateControls < ActiveRecord::Migration[5.0]
  def change
    create_table :controls do |t|
      t.string :name
      t.string :lot
      t.string :start
      t.string :expiration

      t.timestamps
    end
  end
end
