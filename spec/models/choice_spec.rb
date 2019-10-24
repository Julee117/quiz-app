require 'rails_helper'

RSpec.describe Choice, type: :model do
  context "Validations" do
    it { should validate_presence_of(:content) }
  end
end
