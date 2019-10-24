require 'rails_helper'

RSpec.describe Choice, type: :model do
  context "Validations" do
    it { should validate_presence_of(:content) }
  end

  context "Relationships" do
    it { should belong_to(:question) }
    it { should belong_to(:user).optional }
  end
end
