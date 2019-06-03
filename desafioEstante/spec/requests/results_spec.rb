require 'rails_helper'
require 'json'

RSpec.describe 'Results', type: :request do
  before(:all) do
    `rails db:reset`
  end
  
  let(:invalid_params) do
    {
      result: {
        athlete: 'Joe',
        unit: 's',
        competition_id: 2
      }
    }
  end
  
  let(:valid_params) do
    {
      result: {
        athlete: 'Joe',
        value: 10,
        unit: 's',
        competition_id: 2
      }
    }
  end
  
  let(:competition_max_attempts) do
    {
      result: {
        athlete: 'Link',
        value: 9,
        unit: 'm',
        competition_id: 3
      }
    }
  end
  
  let(:competition_finished) do
    {
      result: {
        athlete: 'Link',
        value: 9,
        unit: 's',
        competition_id: 1
      }
    }
  end
  
  describe 'POST /api/results' do
    context 'when request is invalid' do
      before { post results_path, params: invalid_params }
      
      it 'must have http status 422' do
        expect(response).to have_http_status(:bad_request)
      end
    end
    
    context 'when request is valid' do
      let(:response_data) { JSON.parse(response.body)}
      before { post results_path, params: valid_params }
      
      it 'must create new result' do
        expect(response_data['result']['athlete']).to eq(Result.last.athlete)
        expect(response_data['result']['id']).to eq(Result.last.id)
      end
      
      it 'returns status 200 ok' do
        expect(response).to have_http_status(:ok)
      end
    end
    
    context 'when maximum number of attempts is reached' do
      let(:response_data) { JSON.parse(response.body)}
      before { post results_path, params: competition_max_attempts }
      
      it 'must return error message' do
        expect(response_data['errors']['athlete']).to include("Maximum number of javelin attempts: 3")
      end
      
      it 'must have http status 400' do
        expect(response).to have_http_status(:bad_request)
      end
      
    end
    
    context 'cant add result when competition is already finished' do
      let(:response_data) { JSON.parse(response.body)}
      before { post results_path, params: competition_finished }
      
      it 'must return error message' do
        expect(response_data['errors']['competition']).to include("Can't add result to a finished competition")
      end
      
      it 'must have http status 400' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end