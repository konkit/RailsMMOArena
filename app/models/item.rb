class Item < ActiveRecord::Base
  has_and_belongs_to_many :players

  validates :name, :attack_bonus, :defence_bonus, :coin_cost, :required_level, presence: true

  validates :name, blank: false

  validates :attack_bonus, :defence_bonus, :coin_cost, :required_level,
            numericality: {
                only_integer: true
            }

  validates :coin_cost, numericality: { greater_than_or_equal_to: 0 }

  validates :required_level, numericality: { greater_than_or_equal_to: 1 }
end
