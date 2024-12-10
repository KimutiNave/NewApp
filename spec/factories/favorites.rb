FactoryBot.define do
  factory :favorite do
    association :user
    association :another_post
  end
end
