class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :quiz
  has_many :choices
end
