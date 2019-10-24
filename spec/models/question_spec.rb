require 'rails_helper'

RSpec.describe Question, type: :model do
  context "Validations" do
    it { should validate_presence_of(:content) }
  end
end
