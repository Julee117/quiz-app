class User < ApplicationRecord
  has_many :scores
  has_many :choices
  has_many :quizzes, through: :scores

  has_secure_password
end
