class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :content, :correct

  belongs_to :question
  belongs_to :user
end
