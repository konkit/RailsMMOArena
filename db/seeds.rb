# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new
admin.email = 'admin@admin.com'
admin.password = Rails.application.secrets.admin_pass
admin.role = :admin_role
admin.save!

item1 = Item.create(name: 'Item1', coin_cost: 10)
item2 = Item.create(name: 'Item2', coin_cost: 20)
item3 = Item.create(name: 'Item3', coin_cost: 30)

spell1 = Spell.create(name: 'Spell1', coin_cost: 10)
spell2 = Spell.create(name: 'Spell2', coin_cost: 20)
spell3 = Spell.create(name: 'Spell3', coin_cost: 30)
