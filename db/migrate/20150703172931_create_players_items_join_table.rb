class CreatePlayersItemsJoinTable < ActiveRecord::Migration
  def change
    create_table :items_players, id: false do |t|
      t.integer :player_id
      t.integer :item_id
    end
  end
end
