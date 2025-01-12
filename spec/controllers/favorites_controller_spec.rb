require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { create(:user) }
  let(:another_post) { create(:another_post) }
  let(:favorite) { create(:favorite, user_id: user.id, another_post_id: another_post.id) }
  before do
    sign_in user
  end

  describe 'お気に入りの作成' do
    it 'responds with JSON formatted output' do
      expect(favorite.save).to be_truthy
    end
  end
  
  describe 'お気に入りの削除' do
    it 'responds with JSON formatted output' do
      expect(favorite.destroy).to be_truthy
    end
  end
end