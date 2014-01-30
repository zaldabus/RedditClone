class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :sub_name, unique: true, null: false
      t.integer :mod_id, null: false, unique: true
      t.timestamps
    end
    add_index :subs, :mod_id
  end
end
