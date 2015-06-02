class FixVar < ActiveRecord::Migration
  def change
    drop_table "varieties", force: :cascade do |t|
      t.string   "variety"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
