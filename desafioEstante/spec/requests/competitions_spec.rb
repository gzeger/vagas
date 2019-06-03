require 'rails_helper'
require 'json'

RSpec.describe 'Competitions', type: :request do
  let(:valid_create_params) do
    {
      competition: {
        name: '100m dash 2008'
      }
    }
  end
  
  let(:invalid_params) do
    {
      competition: {
        wrong_attribute: ''
      }
    }
  end
  
  let(:end_competition_params) do
    {
      competition: {
        id: 1
      }
    }
  end
  
  let(:ranking_params) do
    {
      competition: {
        id: 3
      }
    }
  end
  
  describe 'POST /api/competitions' do
    context 'when request is invalid' do
      before { post competitions_path, params: invalid_params }
      
      it 'must have http status 422' do
        expect(response).to have_http_status(:bad_request)
      end
    end
    
    context 'when request is valid' do
      let(:response_data) { JSON.parse(response.body)}
      before { post competitions_path, params: valid_create_params }
      
      it 'must create new competition' do
        expect(response_data['competition']['name']).to eq(Competition.last.name)
        expect(response_data['competition']['id']).to eq(Competition.last.id)
      end
      
      it 'returns status 200 ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
  
  describe 'POST /api/competition/end' do
    let(:response_data) { JSON.parse(response.body)}
    before { post competition_end_path, params: end_competition_params }
    
    it 'must finish competition' do
      expect(response_data['competition']['status']).to eq('finished')
    end
    
    it 'returns status 200 ok' do
      expect(response).to have_http_status(:ok)
    end
  end
  
  describe 'POST /api/competition/ranking' do 
    let(:response_data) { JSON.parse(response.body)}
    before { post competition_ranking_path, params: ranking_params }
    it 'must return ranking' do
      expect(response_data['ranking'].size).to eq(3)
    end
    
    it 'returns status 200 ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end