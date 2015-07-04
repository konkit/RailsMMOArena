class AddDefaultsToModels < ActiveRecord::Migration
  def change
    change_column :players, :level, :integer, default: 1
    change_column :players, :exp, :integer, default: 0
    change_column :players, :maxhealth, :integer, default: 100
    change_column :players, :coins, :integer, default: 0

    change_column :items, :attack_bonus, :integer, default: 0
    change_column :items, :defence_bonus, :integer, default: 0
    change_column :items, :coin_cost, :integer, default: 0
    change_column :items, :required_level, :integer, default: 1

    change_column :spells, :damage, :integer, default: 0
    change_column :spells, :prefab_type, :integer, default: 1
    change_column :spells, :cooldown_time, :integer, default: 0
    change_column :spells, :coin_cost, :integer, default: 0
    change_column :spells, :required_level, :integer, default: 1
  end
end
