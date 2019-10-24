require 'rails_helper'

RSpec.describe Quiz, type: :model do
  context "Validations" do
    it { should validate_presence_of(:name) }
  end

  context "Relationships" do
    it { should have_many(:questions).dependent(:destroy) }
    it { should have_many(:scores) }
    it { should have_many(:users).through(:scores) }
  end
end
