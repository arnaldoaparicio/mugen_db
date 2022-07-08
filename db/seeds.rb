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
                                  game_name: 'Capcom vs. SNK 2', image: 'https://mugen-db-demo.s3.amazonaws.com/ryu_by_warusaki3.png', fighter_id: fighter.id)
variant2 = FighterVariant.create!(name: 'Kyo', author: 'Warusaki3',
                                  website: 'https://mugen-infantry.net/', game_name: 'Capcom vs. SNK', image: 'https://mugen-db-demo.s3.amazonaws.com/kyo_by_warusaki.png', fighter_id: fighter4.id)
variant3 = FighterVariant.create!(name: 'Kyo', author: 'Jmorphman', website: 'https://mugenguild.com/', game_name: 'Capcom vs. SNK edit', image: 'https://mugen-db-demo.s3.amazonaws.com/kyo_by_jmorphman.png', fighter_id: fighter4.id)
