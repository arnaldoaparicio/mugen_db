require 'rails_helper'

RSpec.describe 'FighterVariants API' do
  it 'creates a new fighter variant' do
    series1 = Character.create!(origin: 'Marvel Vs. Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series1.id)

    fighter_variant_params = { name: 'Ryu',
                               author: 'Kamekaze',
                               website: 'http://mugenguild.com',
                               game_name: 'Marvel vs. Capcom 2',
                               fighter_id: fighter.id }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/fighter_variants', headers: headers,
                                     params: JSON.generate(fighter_variant: fighter_variant_params)

    created_fighter_variant = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(created_fighter_variant[:data][:type]).to eq('fighter_variant')
    expect(created_fighter_variant[:data][:attributes][:name]).to eq('Ryu')
    expect(created_fighter_variant[:data][:attributes][:author]).to eq('Kamekaze')
    expect(created_fighter_variant[:data][:attributes][:website]).to eq('http://mugenguild.com')
    expect(created_fighter_variant[:data][:attributes][:game_name]).to eq('Marvel vs. Capcom 2')
  end

  it 'does not create a fighter' do
    series1 = Character.create!(origin: 'Marvel Vs. Series')

    fighter_variant_params = { name: 'Ryu',
                               author: 'Kamekaze',
                               website: 'http://mugenguild.com',
                               game_name: 'Marvel vs. Capcom 2' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/fighter_variants', headers: headers,
                                     params: JSON.generate(fighter_variant: fighter_variant_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end

  it "updates an existing fighter's name" do
    series1 = Character.create!(origin: 'Marvel Vs. Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series1.id)
    fighter_variant_ryu = FighterVariant.create!(name: 'Ryu', author: 'Kamekaze', website: 'https://mugenguild.com', game_name: 'Marvel vs. Capcom 2', fighter_id: fighter.id)

    expect(fighter_variant_ryu.name).to eq('Ryu')

    fighter_variant_params = { name: 'MvC2 Ryu',
                               author: 'Kamekaze',
                               website: 'http://mugenguild.com',
                               game_name: 'Marvel vs. Capcom 2',
                               fighter_id: fighter.id }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch '/api/v1/characters/:series_id/:fighter_id/:fighter_variant_id'

    new_fighter_variant = FighterVariant.find(fighter_variant_ryu.id)

    expect(response).to be_successful
    expect(new_fighter_variant.name).to eq('MvC2 Ryu')
  end

    it "updates an existing fighter's author" do
    series1 = Character.create!(origin: 'Marvel Vs. Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series1.id)
    fighter_variant_ryu = FighterVariant.create!(name: 'Ryu', author: 'Kamekaze', website: 'https://mugenguild.com', game_name: 'Marvel vs. Capcom 2', fighter_id: fighter.id)

    expect(fighter_variant_ryu.author).to eq('Kamekaze')

    fighter_variant_params = { name: 'Ryu',
                               author: 'Phantom.of.the.Server',
                               website: 'http://mugenguild.com',
                               game_name: 'Marvel vs. Capcom 2',
                               fighter_id: fighter.id }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch '/api/v1/characters/:series_id/:fighter_id/:fighter_variant_id'

    new_fighter_variant = FighterVariant.find(fighter_variant_ryu.id)

    expect(response).to be_successful
    expect(new_fighter_variant.author).to eq('Phantom.of.the.Server')
  end
end
