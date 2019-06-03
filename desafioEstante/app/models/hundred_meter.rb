class HundredMeter < sport
  has_many :competitions
  
  def generate_ranking(competition)
    competition.results.order(:value)
  end
end
