class User < ApplicationRecord
  has_many :scores
  has_many :choices
  has_many :quizzes, through: :scores

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def get_score(choices)
    score = 0
    answers = []
    choices.values.each do |choice|
      option = Choice.find(choice.to_i)
      option.update_attribute(:user_id, self.id)
      answers << option
    end
    answers.each do |answer|
      if answer.correct
        score += 1
      end
    end
    score = (score.to_f / (choices.keys.length)) * 100
    return score
  end

  def add_attribute_value(id)
    self.update_attribute(:topic, id)
  end
end
