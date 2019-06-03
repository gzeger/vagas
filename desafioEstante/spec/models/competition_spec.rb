require 'rails_helper'

RSpec.describe Competition do
  subject(:competition) { Competition.new }

  describe '#valid?' do
    it 'is invalid without attribute name' do
      expect(competition).not_to be_valid
      expect(competition.errors).to have_key(:name)
    end
  end
  
  describe '#javelin?' do
    it 'check if the competition is javelin' do
      competition.name = 'Javelin Paris 2024'
      expect(competition).to be_javelin
    end
  end
  
  describe '#finished' do
    it 'check if competition was finished' do
      competition.name = '100m dash Tokyo'
      competition.finished!
      expect(competition).to be_finished
    end
  end
  
  describe '#ranking' do
    it 'check if ranking was called' do
      expect(competition).to receive(:ranking)
      
      competition.ranking
    end
  end
  
end