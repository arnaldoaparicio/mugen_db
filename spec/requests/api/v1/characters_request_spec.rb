require 'rails_helper'


RSpec.describe 'Characters API' do
  it 'shows all series for characters' do
    series1 = Character.create!(origin: 'Marvel Vs. Series')
    series2 = Character.create!(origin: 'Capcom vs. SNK Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series2.id)
    fighter2 = Fighter.create!(name: 'Guile', character_id: series2.id)

    get '/api/v1/characters'

    expect(response).to be_successful
    characters = JSON.parse(response.body, symbolize_names: true)
    expect(characters).to be_a Hash

    expect(characters).to have_key(:data)

    characters[:data].each do |character|
      expect(character).to have_key(:id)
      expect(character).to have_key(:type)
      expect(character).to have_key(:attributes)
      expect(character[:attributes]).to have_key(:origin)
    end
  end

  it 'has game series with several fighters/characters' do
    series1 = Character.create!(origin: 'The Fallen Angel')
    series2 = Character.create!(origin: 'Capcom vs. SNK Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series2.id)
    fighter2 = Fighter.create!(name: 'Guile', character_id: series2.id)
    fighter3 = Fighter.create!(name: 'Roche', character_id: series1.id)

    get "/api/v1/characters/#{series2.id}"

    fighters = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful

    expect(fighters).to have_key(:data)
    expect(fighters[:data].count).to eq(2)
    expect(fighters[:data][0][:attributes][:name]).to_not eq('Roche')
    expect(fighters[:data][1][:attributes][:name]).to_not eq('Roche')

    fighters[:data].each do |fighter|
      expect(fighter[:attributes]).to have_key(:name)
    end
  end

  it 'shows the fighter variants' do
    series2 = Character.create!(origin: 'Capcom vs. SNK Series')
    fighter = Fighter.create!(name: 'Ryu', character_id: series2.id)
    variant1 = FighterVariant.create!(name: 'Ryu', author: 'Warusaki3', website: 'http://mugenguild.com/', game_name: 'Capcom vs. SNK 2', fighter_id: fighter.id)
    variant2 = FighterVariant.create!(name: 'Ryu', author: 'Phantom.of.the.Server', website: 'https://mugen-infantry.net/', game_name: 'Capcom vs. SNK', fighter_id: fighter.id)

    get "/api/v1/characters/#{series2.id}/#{fighter.id}"

    fighter_variants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(fighter_variants).to have_key(:data)

    fighter_variants[:data].each do |variant|
      expect(variant[:attributes]).to have_key(:name)
      expect(variant[:attributes]).to have_key(:author)
      expect(variant[:attributes]).to have_key(:game_name)
    end
  end

  it 'creates a new character' do
    character_params = { origin: 'Marvel vs. Series' }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post '/api/v1/characters', headers: headers, params: JSON.generate(character: character_params)
    expect(response).to be_successful
    expect(response.status).to eq(201)

    character = JSON.parse(response.body, symbolize_names: true)

    expect(character).to have_key(:data)
    expect(character[:data]).to have_key(:attributes)

    expect(character[:data][:attributes]).to have_key(:origin)
  end

  it 'updates an existing character origin' do
    character = Character.create!(origin: 'Fatal Fury')
    character_params = { origin: 'Fatal Fury Special' }

    headers = { 'CONTENT_TYPE' => 'application/json' }
    patch "/api/v1/characters/#{character.id}", headers: headers, params: JSON.generate(character_params)

    updated_character = Character.find(character.id)

    expect(updated_character.origin).to eq('Fatal Fury Special')
  end
end
