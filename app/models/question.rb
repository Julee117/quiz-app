class Question < ApplicationRecord
  belongs_to :quiz
  has_many :choices, :dependent => :destroy

  validates :content, presence: true

  accepts_nested_attributes_for :choices, :allow_destroy => true
end
