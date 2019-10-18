class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :value

  belongs_to :quiz
  belongs_to :user
end
