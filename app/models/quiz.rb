class Quiz < ApplicationRecord
  has_many :questions, :dependent => :destroy
  has_many :scores
  has_many :users, through: :scores

  validates :name, presence: true

  accepts_nested_attributes_for :questions, :allow_destroy => true
end
