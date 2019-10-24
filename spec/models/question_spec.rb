require 'rails_helper'

RSpec.describe Question, type: :model do
  context "Validations" do
    it { should validate_presence_of(:content) }
  end

  context "Relationships" do
    it { should have_many(:choices).dependent(:destroy) }
    it { should belong_to(:quiz) }
  end
end
