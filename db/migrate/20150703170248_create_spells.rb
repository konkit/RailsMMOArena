class CreateSpells < ActiveRecord::Migration
  def change
    create_table :spells do |t|
      t.string  :name
      t.integer :damage
      t.integer :prefab_type
      t.integer :cooldown_time
      t.integer :coin_cost
      t.integer :required_level

      t.timestamps null: false
    end
  end
end
