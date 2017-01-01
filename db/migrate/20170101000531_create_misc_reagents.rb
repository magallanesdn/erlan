class CreateMiscReagents < ActiveRecord::Migration[5.0]
  def change
    create_table :misc_reagents do |t|
      t.string :kit
      t.string :lot
      t.date :start
      t.date :expiration
      t.integer :test_left
      t.integer :box
    end
  end
end
