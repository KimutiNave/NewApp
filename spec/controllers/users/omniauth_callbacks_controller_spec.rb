require 'rails_helper'
RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    OmniAuth.config.mock_auth[:twitter2] = nil
    OmniAuth.config.mock_auth[:google_oauth2] = nil
  end
  context "X(Twitter)認証ができるとき" do
    it 'ログインボタンを押してユーザーがTwitter認証を許可した時' do
      #binding.pry
      Rails.application.env_config['omniauth.auth'] = twitter_mock
      visit category_path
      expect(page).to_not have_content('新しいメモを作る') # ログイン前は新しいメモを作るという表示が無い
      find_link('X(Twitter)でログイン', href: '/users/auth/twitter2').click # ログインボタンをクリックしてTwitter認証を行う
      expect(page).to have_content('新しいメモを作る')  # リダイレクトされてカテゴリーページに戻るとログインできている
    end
  end
  context 'Twitter認証ができないとき' do
    it 'ログインボタンを押してユーザーがTwitter認証をキャンセルした時' do
      Rails.application.env_config['omniauth.auth'] = twitter_invalid_mock
      visit root_path
      expect(page).to have_content('このアプリは何が出来る？') # ログイン失敗時にホーム画面に戻る
    end
  end

  context "Google認証ができるとき" do
    it 'ログインボタンを押してユーザーがGoogle認証を許可した時' do
      Rails.application.env_config['omniauth.auth'] = google_mock
      visit category_path
      expect(page).to_not have_content('新しいメモを作る') # ログイン前は新しいメモを作るという表示が無い
      find_link('Googleアカウントでログイン', href: '/users/auth/google_oauth2').click # ログインボタンをクリックしてTwitter認証を行う
      expect(page).to have_content('新しいメモを作る')  # リダイレクトされてカテゴリーページに戻るとログインできている
    end
  end

  context 'Google認証ができないとき' do
    it 'ログインボタンを押してユーザーがTwitter認証をキャンセルした時' do
      Rails.application.env_config['omniauth.auth'] = google_invalid_mock
      visit root_path
      expect(page).to have_content('このアプリは何が出来る？') # ログイン失敗時にホーム画面に戻る
    end
  end
end