FactoryBot.define do
  factory :choice do
    content { Faker::Lorem.sentence }
    question_id { nil }
    user_id { nil }
    correct {false}
  end
end
