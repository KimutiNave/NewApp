require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:bookmark) { create(:bookmark, user_id: user.id, post_id: post.id) }

  before do
    sign_in user
  end

  describe 'お気に入りの作成' do
    it "responds with JSON formatted output" do
      expect(bookmark.save).to be_truthy
    end
  end
  
  describe 'お気に入りの削除' do
    it "responds with JSON formatted output" do
      expect(bookmark.destroy).to be_truthy
    end
  end
end