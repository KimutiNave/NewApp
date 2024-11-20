FactoryBot.define do
  factory :another_post do
    association :user
    association :file_type
    error_type_name {'エラー用'}
    status_error_name {'Name Error'}
    other_error_name {'other_error_name'}
    title {'テスト'}
    other_file_name {'other_file_name'}
    code_content {'code_content'}
    other_content {'other_content'}
    notice_days { :noalerm }
    confirmn { false }
  end
end
