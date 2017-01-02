class AddTimestampsToMiscReagent < ActiveRecord::Migration[5.0]
  def change
    add_column :misc_reagents, :created_at, :datetime
    add_column :misc_reagents, :updated_at, :datetime
  end
end
