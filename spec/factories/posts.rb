FactoryBot.define do
  factory :post do
    association :user
    association :file_type
    save_type_name {'保存用'}
    title {'テスト'}
    other_file_name {'other_file_name'}
    code_content {'content'}
    other_content {'other_content'}
    verify {[false]}
    notify_days {0}
  end
end
