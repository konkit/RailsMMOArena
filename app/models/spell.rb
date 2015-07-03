class Spell < ActiveRecord::Base
  has_and_belongs_to_many :players

  validates :name, :damage, :prefab_type, :cooldown_time, :coin_cost, :required_level,
            presence: true

  validates :name, blank: false

  validates :damage, :prefab_type, :cooldown_time, :coin_cost, :required_level,
            numericality: {
                only_integer: true
            }

  validates :required_level, numericality: { greater_than_or_equal_to: 1 }

  validates :damage, :prefab_type, :cooldown_time, :coin_cost, numericality: { greater_than_or_equal_to: 0 }
end
