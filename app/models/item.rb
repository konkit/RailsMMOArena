class Item < ActiveRecord::Base
  has_and_belongs_to_many :players

  validates :name, presence: true, blank: false
  validates :attack_bonus, :defence_bonus,
            presence: true,
            numericality: { only_integer: true }

  validates :coin_cost,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0}

  validates :required_level,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1}
end
