class Javelin < ApplicationRecord
  has_many :competitions
  
  def generate_ranking(competition)
    grouped_results = competition.results.group_by(&:athlete)
  end
end
