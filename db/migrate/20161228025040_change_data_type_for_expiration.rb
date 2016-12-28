class ChangeDataTypeForExpiration < ActiveRecord::Migration[5.0]
  def change
    change_column :controls, :expiration, :date
  end
end
