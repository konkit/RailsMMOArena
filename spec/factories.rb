FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password               "password"
    password_confirmation  "password"
  end

  factory :player do
    name      "Player1"
    level     1
    exp       0
    maxhealth 100
    coins     0
    association :user, factory: :user
  end

  factory :item do
    name            "Item1"
    attack_bonus    0
    defence_bonus   0
    coin_cost       0
    required_level  1
  end

  factory :spell do
    name            "Spell1"
    damage          100
    prefab_type     1
    cooldown_time   0
    coin_cost       50
    required_level  1
  end
end