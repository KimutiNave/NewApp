require 'rake_helper'
describe 'Create:Alerm' do
  let(:user) { create(:user) }
  context 'notice_daysに「minute」が設定されている場合' do
    before do
      AnotherPost.create(notice_days: :minute, confirmn: false, user: user) # 必要な属性を指定
    end

    subject(:task) { Rake.application['alerm:create_alerm_timely'] }
  
    it 'creates alerm' do
      expect { task.invoke }.to change { Alerm.count }.by(1)
    end
  end

  context 'notice_daysに「day」が設定されている場合' do
    before do
      AnotherPost.create(notice_days: :day, confirmn: false, user: user) # 必要な属性を指定
    end

    subject(:task) { Rake.application['alerm:create_alerm_daily'] }
  
    it 'creates alerm' do
      expect { task.invoke }.to change { Alerm.count }.by(1)
    end
  end

  context 'notice_daysに「minute」が設定されている場合' do
    before do
      AnotherPost.create(notice_days: :week, confirmn: false, user: user) # 必要な属性を指定
    end

    subject(:task) { Rake.application['alerm:create_alerm_weekly'] }
  
    it 'creates alerm' do
      expect { task.invoke }.to change { Alerm.count }.by(1)
    end
  end

  context 'notice_daysに「month」が設定されている場合' do
    before do
      AnotherPost.create(notice_days: :month, confirmn: false, user: user) # 必要な属性を指定
    end

    subject(:task) { Rake.application['alerm:create_alerm_monthly'] }
  
    it 'creates alerm' do
      expect { task.invoke }.to change { Alerm.count }.by(1)
    end
  end
end