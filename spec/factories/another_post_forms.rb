FactoryBot.define do
  factory :another_post_form do
    association :user
    association :file_type
    user_id {1}
    error_type_name {'エラー用'}
    status_error_name {'Name Error'}
    other_error_name {'other_error_name'}
    title {'テスト'}
    file_type_id {1}
    other_file_name {'other_file_name'}
    code_content {'code_content'}
    other_content {'other_content'}
    notice_days {0}
    confirmn {[false]}
  end
end
