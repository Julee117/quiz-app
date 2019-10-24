require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  context "Relationships" do
    it { should have_many(:choices) }
    it { should have_many(:scores) }
    it { should have_many(:quizzes).through(:scores) }
  end
end
