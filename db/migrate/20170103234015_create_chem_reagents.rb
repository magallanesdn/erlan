class CreateChemReagents < ActiveRecord::Migration[5.0]
  def change
    create_table :chem_reagents do |t|
      t.string :reagent
      t.string :lot
      t.string :start
      t.string :expiration
      t.integer :flex
      t.integer :box
      
      t.timestamps
    end
  end
end
