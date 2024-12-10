FactoryBot.define do
  factory :alerm do
    association :user
    association :another_post
  end
end
