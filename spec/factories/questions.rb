FactoryBot.define do
  factory :question do
    content { Faker::Lorem.sentence }
    quiz_id { nil }
  end
end
