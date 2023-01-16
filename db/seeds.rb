# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

series1 = Character.create!(origin: 'The Fallen Angel')
series2 = Character.create!(origin: 'Capcom vs. SNK Series')
fighter = Fighter.create!(name: 'Ryu', character_id: series2.id)
fighter2 = Fighter.create!(name: 'Guile', character_id: series2.id)
fighter3 = Fighter.create!(name: 'Roche', character_id: series1.id)
fighter4 = Fighter.create!(name: 'Kyo', character_id: series2.id)

variant1 = FighterVariant.create!(name: 'Ryu', author: 'Warusaki3', website: 'http://mugenguild.com/',
                                  game_name: 'Capcom vs. SNK 2', fighter_id: fighter.id)
