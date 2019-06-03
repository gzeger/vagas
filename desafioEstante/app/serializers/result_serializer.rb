class ResultSerializer < ActiveModel::Serializer
  belongs_to :competition
  attributes :id, :athlete, :value, :unit
end
