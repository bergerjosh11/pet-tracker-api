require 'rails_helper'

RSpec.describe 'Pets API', type: :request do
  describe 'POST /api/v1/pets' do
    let(:valid_attributes) do
      {
          pet: {
              pet_type: 'Dog',
              tracker_type: 'medium',
              owner_id: 123,
              in_zone: false,
              lost_tracker: false
          }
      }
    end

    it 'creates a new pet' do
      post '/api/v1/pets', params: valid_attributes
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['pet_type']).to eq('Dog')
    end

    it 'returns error with invalid pet_type' do
      invalid_attributes = valid_attributes.deep_merge(pet: { pet_type: 'Lizard' })
      post '/api/v1/pets', params: invalid_attributes
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['errors']).to include("Pet type is not included in the list")
    end
  end

  describe 'GET /api/v1/pets/out_of_zone_summary' do
    before do
      Pet.create!(pet_type: 'Cat', tracker_type: 'small', owner_id: 1, in_zone: false, lost_tracker: false)
      Pet.create!(pet_type: 'Cat', tracker_type: 'big', owner_id: 2, in_zone: false, lost_tracker: false)
      Pet.create!(pet_type: 'Dog', tracker_type: 'medium', owner_id: 3, in_zone: true, lost_tracker: false)
    end

    it 'returns summary of pets outside power saving zone' do
      get '/api/v1/pets/out_of_zone_summary'
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)

      expect(json['Cat']['small']).to eq(1)
      expect(json['Cat']['big']).to eq(1)
      expect(json['Dog']).to be_nil
    end
  end
end
