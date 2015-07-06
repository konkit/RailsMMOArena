require 'rails_helper'

RSpec.describe Player, type: :model do
  context "buy item" do
    before(:each) do
      @player = build(:player, coins: 100)
    end

    it "should succeed if player has enough money" do
      @item = build(:item, coin_cost: 50)

      @player.buy_item(@item)

      expect(@player.coins).to eq(50)
      expect(@player.items).to include(@item)
    end

    it "should fail if player has not enough money" do
      @item = build(:item, coin_cost: 150)

      @player.buy_item(@item)

      expect(@player.coins).to eq(100)
      expect(@player.items).not_to include(@item)
    end
  end

  context "buy spell" do
    before(:each) do
      @player = build(:player, coins: 100)
    end

    it "should succeed if player has enough money" do
      @spell = build(:spell, coin_cost: 50)

      @player.buy_spell(@spell)

      expect(@player.coins).to eq(50)
      expect(@player.spells).to include(@spell)
    end

    it "should fail if player has not enough money" do
      @spell = build(:spell, coin_cost: 150)

      @player.buy_spell(@spell)

      expect(@player.coins).to eq(100)
      expect(@player.spells).not_to include(@spell)
    end
  end

  context "sell item" do
    before(:each) do
      @player = build(:player, coins: 100)
    end

    it "should succeed if player has the item" do
      @item = build(:item, coin_cost: 50)
      @player.items << @item

      @player.sell_item(@item)

      expect(@player.coins).to eq(150)
      expect(@player.items.count).to eql(0)
    end

    it "should fail if player doesnt have the item" do
      @item = build(:item, coin_cost: 50)

      @player.sell_item(@item)

      expect(@player.coins).to eq(100)
    end
  end

  context "sell spell" do
    before(:each) do
      @player = build(:player, coins: 100)
    end

    it "should succeed if player has the spell" do
      @spell = build(:spell, coin_cost: 50)
      @player.spells << @spell

      @player.sell_spell(@spell)

      expect(@player.coins).to eq(150)
      expect(@player.spells.count).to eql(0)
    end

    it "should fail if player doesnt have the spell" do
      @spell = build(:spell, coin_cost: 50)

      @player.sell_spell(@spell)

      expect(@player.coins).to eq(100)
    end
  end
end
