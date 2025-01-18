require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let(:post_form) { PostForm.new(attributes_for(:post, user_id: user.id), post: post) }

  before do
    sign_in user
  end

  describe '保存用メモの編集' do
    let(:valid_attributes) do
      {
        title: '新しいタイトル',
        file_type_id: 2,
        code_content: 'メソッド',
        other_content: 'コメント'
      }
    end

    before do
      post_form.assign_attributes(valid_attributes)
    end

    context '有効な属性が与えられた場合' do
      it 'Postが更新される' do
        # sliceで指定した属性だけを抽出し、stringify_keysでキーを文字列に変換
        expect { post_form.update_post }.to change { post.reload.attributes.slice('title', 'file_type_id', 'code_content', 'other_content') }
          .to(include(valid_attributes.stringify_keys))
      end

      it '更新が成功するとtrueを返す' do
        expect(post_form.update_post).to be true
      end
    end

    context '保存用メモの削除' do
      it '保存用メモの削除が成功' do
        expect {
          delete :destroy, params: { id: post.id }
        }.to change { Post.count }.by(-1)
      end
    end
  end
end