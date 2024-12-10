require 'rails_helper'
RSpec.describe AnotherPostsController, type: :controller do
  let(:user) { create(:user) }
  let!(:another_post) { create(:another_post, user: user) }
  let(:another_post_form) { AnotherPostForm.new(attributes_for(:another_post, user_id: user.id), another_post: another_post) }

  before do
    sign_in user
  end

  describe 'エラー用メモの編集フォーム' do
    let(:valid_attributes) do
      {
        title: '新しいタイトル',
        file_type_id: 2,
        status_error_name: 'No Method Error',
        code_content: 'defメソッド',
        other_content: 'コメント'
      }
    end

    before do
      another_post_form.assign_attributes(valid_attributes)
    end

    context '有効な属性が与えられた場合' do
      it 'AnotherPostが更新される' do
        expect { another_post_form.update_another_post }.to change { another_post.reload.attributes.slice('title', 'file_type_id', 'status_error_name', 'code_content', 'other_content') }
          .to(include(valid_attributes.stringify_keys))#sliceで指定した属性だけを抽出し、stringify_keysでキーを文字列に変換
      end

      it '更新が成功するとtrueを返す' do
        expect(another_post_form.update_another_post).to be true
      end
    end

    context 'エラー用メモの削除' do
      it 'エラー用メモの削除が成功' do
        expect {
          delete :destroy, params: { id: another_post.id }
        }.to change { AnotherPost.count }.by(-1)
      end
    end
  end
end
  