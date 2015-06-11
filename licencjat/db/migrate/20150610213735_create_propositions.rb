class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|

      t.timestamps null: false
    end
  end
end
