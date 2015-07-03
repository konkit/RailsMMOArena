class Player < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_and_belongs_to_many :spells

  validates :name, presence: true, blank: false

  validates :exp, :coins,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :maxhealth, :level,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
