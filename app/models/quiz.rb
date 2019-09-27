class Quiz < ApplicationRecord
  has_many :questions, :dependent => :destroy
  has_many :scores
  has_many :users, through: :scores
end
