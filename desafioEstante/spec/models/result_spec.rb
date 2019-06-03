require 'rails_helper'

RSpec.describe Result do
  
  before(:all) do
    `rails db:reset`
  end
  
  let(:competition) { Competition.new }
  subject(:result) { Result.new }

  context '#valid?' do
    it 'is invalid if competition is already finished' do
      competition.name = '100m dash finished'
      competition.finished!
      result.competition = competition

      expect(result).not_to be_valid
      expect(result.errors[:competition]).to include("Can't add result to a finished competition")
    end
  end
end