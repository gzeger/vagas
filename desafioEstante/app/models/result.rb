class Result < ApplicationRecord
  belongs_to :competition
  
  validates :competition_id, :athlete, :value, :unit, presence: true
  
  validate :unique_athlete_100m, unless: 'competition.javelin?'
  validate :finished?
  validate :javelin_attempts, if: 'competition.javelin?'
  
  def unique_athlete_100m
    if Result.where(athlete: athlete, competition_id: competition_id).any?
      self.errors.add(:athlete, :exceeds_max_attempts, message: 'Maximum number of attempts: 1')
    end
  end
  
  def finished?
    if competition.finished?
      self.errors.add(:competition, :competition_finished, message: "Can't add result to a finished competition")
    end
  end
  
  def javelin_attempts
    if competition.results.where(athlete: athlete).size >= 3
      self.errors.add(:athlete, :exceeds_max_attempts, message: 'Maximum number of javelin attempts: 3')
    end
  end
end
