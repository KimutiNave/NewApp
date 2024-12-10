require 'rails_helper'

RSpec.describe PostForm, type: :model do
  let(:post_form) { PostForm.new({}, post: Post.new(attributes)) }
  describe '保存用メモの保存' do
    context '必須項目（その他が選択されていない場合）' do
      let(:attributes){ 
        {save_type_name: '保存用',
        title: 'テスト',
        code_content: 'content',
        verify: [false],
        notify_days: 0}
      }
      it '保存に成功する' do
        post_form.assign_attributes(attributes)
        expect(post_form.save).to be_truthy
      end
    end

    context '必須項目（その他が選択されている場合）' do
      let(:attributes){
        {save_type_name: '保存用',
        title: 'テスト',
        code_content: 'content',
        other_content: 'other_content',
        verify: [false],
        notify_days: 0}
      }
      it '保存に成功する' do
        post_form.assign_attributes(attributes)
        expect(post_form.save).to be_truthy
      end
    end
  end
end