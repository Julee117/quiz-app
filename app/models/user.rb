class User < ApplicationRecord
  has_many :scores
  has_many :choices
  has_many :quizzes, through: :scores

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
