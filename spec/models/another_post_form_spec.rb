require 'rails_helper'

RSpec.describe AnotherPostForm, type: :model do
  let(:another_post_form) {AnotherPostForm.new({}, another_post: AnotherPost.new(attributes))}
  describe 'エラー用メモの保存' do
    context '必須項目（その他のエラー・ファイル名が選択されていない場合）' do
      let(:attributes){
        { error_type_name: 'エラー用',
        status_error_name: 'Name Error',
        title: 'テスト',
        code_content: 'code_content',
        other_content: 'other_content',
        notice_days: 0,
        confirmn: [false] }
      }
      it '保存に成功する' do
        another_post_form.assign_attributes(attributes)
        expect(another_post_form.save).to be_truthy
      end
    end

    context '必須項目（その他のエラー・ファイル名が選択されている場合）' do
      let(:attributes){
        { error_type_name: 'エラー用',
        other_error_name: 'other_error_name',
        title: 'テスト',
        other_file_name: 'other_file_name',
        code_content: 'code_content',
        other_content: 'other_content',
        notice_days: 0,
        confirmn: [false] }
      }
      it '保存に成功する' do
        another_post_form.assign_attributes(attributes)
        expect(another_post_form.save).to be_truthy
      end
    end
  end
end