require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }
  
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end

  describe 'ログアウト処理' do
    it 'ユーザーがログアウトできる' do
      delete :destroy
      expect(response).to redirect_to(new_user_session_path)
      expect(flash[:notice]).to eq('ログアウトしました。')
    end
  end
end
