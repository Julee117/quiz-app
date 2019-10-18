class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :topic

  has_many :scores
  has_many :choices
end
