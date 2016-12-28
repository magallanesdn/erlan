class ChangeDataTypeForStart < ActiveRecord::Migration[5.0]
  def change
    change_column :controls, :start, :date
  end
end
