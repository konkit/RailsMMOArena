class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :level
      t.integer :exp
      t.integer :maxhealth
      t.integer :coins

      t.timestamps null: false
    end
  end
end
