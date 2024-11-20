require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe "退会処理" do
    it "ユーザーが退会できる" do
      expect {
        patch :withdrawal, params: { id: user.id }
        user.reload  # ユーザーのデータを再読み込み
      }.to_not change(User, :count)  # ユーザー数は変わらないことを確認
      expect(user.is_deleted).to be_truthy  # 論理削除フラグが立っていることを確認
      expect(response).to redirect_to(new_user_session_path)  # 退会後のリダイレクト先を確認
      expect(flash[:notice]).to eq("退会処理を実行いたしました")  # フラッシュメッセージの確認
    end
  end
end