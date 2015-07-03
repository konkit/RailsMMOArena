class CreatePlayersSpellsJoinTable < ActiveRecord::Migration
  def change
    create_table :players_spells, id: false do |t|
      t.integer :player_id
      t.integer :spell_id
    end
  end
end
