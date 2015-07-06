class Player < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_and_belongs_to_many :spells
  belongs_to :user

  validates :name, presence: true, blank: false

  validates :exp, :coins,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :maxhealth, :level,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :user, presence: true

  def buy_item(item)
    if self.coins < item.coin_cost
      return false
    end

    self.coins -= item.coin_cost
    self.items << item
    return true
  end

  def sell_item(item)
    if !self.items.include?(item)
      return false
    end

    self.coins += item.coin_cost
    self.items.delete(item)
    return true
  end

  def buy_spell(spell)
    if self.coins < spell.coin_cost
      return false
    end

    self.coins -= spell.coin_cost
    self.spells << spell
    return true
  end

  def sell_spell(spell)
    if !self.spells.include?(spell)
      return false
    end

    self.coins += spell.coin_cost
    self.spells.delete(spell)
    return true
  end
end
