class CompetitionSerializer < ActiveModel::Serializer
  has_many :results
  attributes :id, :name, :status
end
