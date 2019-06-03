class Competition < ApplicationRecord
  has_many :results
  
  validates :name, uniqueness: true, presence: true
  
  enum status: { ongoing: 0, finished: 1 }
  
  def ranking
    if javelin?
      self.results
        .group_by(&:athlete)
        .map { |_, results| results.max_by(&:value) }
        .sort_by{|r| -r[:value]}
    else
      self.results.order(:value)
    end
  end
  
  def javelin?
    self.name.downcase.include?("javelin") || self.name.downcase.include?("dardo") 
  end
end
