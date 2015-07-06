require 'rails_helper'

RSpec.describe Player, type: :model do
  subject(:player) { build(:player, coins: 100) }

  describe "buy_item" do
    let(:item) { build(:item, coin_cost: 50) }

    context "when player has enough money" do
      it "should execute the buy" do
        player.buy_item(item)

        expect(player.coins).to eq(50)
        expect(player.items).to include(item)
      end
    end

    context "when player has not enough money" do
      it "should not change player state" do
        player.coins = 20

        player.buy_item(item)

        expect(player.coins).to eq(20)
        expect(player.items).not_to include(item)
      end
    end
  end

  describe "buy_spell" do
    let(:spell) { build(:spell, coin_cost: 50) }

    context "when player has enough money" do
      it "should execute the buy" do
        player.buy_spell(spell)

        expect(player.coins).to eq(50)
        expect(player.spells).to include(spell)
      end
    end

    context "when player has not enough money" do
      it "should not change player state" do
        player.coins = 20

        player.buy_spell(spell)

        expect(player.coins).to eq(20)
        expect(player.spells).not_to include(spell)
      end
    end
  end

  describe "sell_item" do
    let(:item) { build(:item, coin_cost: 50) }

    context "when player has the item" do
      it "should execute the sell" do
        player.items << item

        player.sell_item(item)

        expect( player.coins).to eq(150)
        expect( player.items.count).to eql(0)
      end
    end

    context "when player doesnt have the item" do
      it "should not change player state" do
        item = build(:item, coin_cost: 50)

        player.sell_item(item)

        expect( player.coins ).to eq(100)
      end
    end
  end

  describe "sell_spell" do
    let(:spell) { build(:spell, coin_cost: 50) }

    context "when player has the spell" do
      it "should execute the sell" do
        player.spells << spell

        player.sell_spell(spell)

        expect( player.coins).to eq(150)
        expect( player.spells.count).to eql(0)
      end
    end

    context "when player doesnt have the spell" do
      it "should not change player state" do
        spell = build(:spell, coin_cost: 50)

        player.sell_spell(spell)

        expect( player.coins ).to eq(100)
      end
    end
  end

  describe "validations" do
    context "when all fields are properly filled" do
      it { is_expected.to be_valid }
    end

    context "when name is nil " do
      before(:each) { player.name = nil }
      it { is_expected.not_to be_valid }
    end

    context "when name is blank " do
      before(:each) { player.name = "" }
      it { is_expected.not_to be_valid }
    end

    context "when coins are nil " do
      before(:each) { player.coins = nil }
      it { is_expected.not_to be_valid }
    end

    context "when coins are negative " do
      before(:each) { player.coins = -5 }
      it { is_expected.not_to be_valid }
    end

    context "when exp is nil " do
      before(:each) { player.exp = nil }

      it { is_expected.not_to be_valid }
    end

    context "when exp is negative " do
      before(:each) { player.exp = -5 }
      it { is_expected.not_to be_valid }
    end

    context "when maxhealth is nil " do
      before(:each) { player.maxhealth = nil }
      it { is_expected.not_to be_valid }
    end

    context "when maxhealth is negative " do
      before(:each) { player.maxhealth = -5 }
      it { is_expected.not_to be_valid }
    end

    context "when maxhealth is zero " do
      before(:each) { player.maxhealth = 0 }
      it { is_expected.not_to be_valid }
    end

    context "when level is nil " do
      before(:each) { player.level = nil }
      it { is_expected.not_to be_valid }
    end

    context "when level is negative " do
      before(:each) { player.level = -5 }
      it { is_expected.not_to be_valid }
    end

    context "when level is zero " do
      before(:each) { player.level = 0 }
      it { is_expected.not_to be_valid }
    end

    context "when user is nil " do
      before(:each) { player.user = nil }
      it { is_expected.not_to be_valid }
    end
  end

end
