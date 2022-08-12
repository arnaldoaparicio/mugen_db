require 'rails_helper'

RSpec.describe 'Fighters API' do
  it 'creates a new fighter' do
    series1 = Character.create!(origin: 'Marvel vs Series/X-COTA')

    fighter_params = {
      name: 'Spiderman',
      character_id: series1.id
    }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/fighters', headers: headers, params: JSON.generate(fighter: fighter_params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    fighter = JSON.parse(response.body, symbolize_names: true)

    expect(fighter).to have_key(:data)
    expect(fighter[:data]).to have_key(:attributes)
    expect(fighter[:data][:attributes]).to have_key(:name)
  end

  it 'does not create a new fighter' do
    fighter_params = { name: 'Spiderman'}

    headers = { 'CONTENT-TYPE' => 'application/json' }

    post '/api/v1/fighters', headers: headers, params: JSON.generate(fighter: fighter_params)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
  end
end
