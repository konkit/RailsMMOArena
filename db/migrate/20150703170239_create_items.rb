class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :name
      t.integer :attack_bonus
      t.integer :defence_bonus
      t.integer :coin_cost
      t.integer :required_level

      t.timestamps null: false
    end
  end
end
