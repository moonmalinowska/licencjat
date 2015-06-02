class AddVarietyToAttraction < ActiveRecord::Migration
  def change
    add_column :attractions, :variety_id, :integer
  end
end
