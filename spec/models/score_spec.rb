require 'rails_helper'

RSpec.describe Score, type: :model do
  context "Relationships" do
    it { should belong_to(:quiz) }
    it { should belong_to(:user) }
  end
end
