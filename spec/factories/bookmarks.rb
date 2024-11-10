FactoryBot.define do
  factory :bookmark do
    #association :user
    #association :post
    post {build(:post)}
  end
end
