require 'rake_helper'

describe 'Create NotificationSetting' do
  let(:user) { create(:user) }
  context 'notify_daysに「minute」が設定されている場合' do
    before do
      Post.create(notify_days: :minute, verify: false, user: user) 
    end
    subject(:task) { Rake.application['notification_setting:create_notification_setting_timely'] }

    it 'create notification_setting' do
      expect { task.invoke }.to change { NotificationSetting.count }.by(1)
    end
  end

  context 'notify_daysに「day」が設定されている場合' do
    before do
      Post.create(notify_days: :day, verify: false, user: user) 
    end
    subject(:task) { Rake.application['notification_setting:create_notification_setting_daily'] }

    it 'create notification_setting' do
      expect { task.invoke }.to change { NotificationSetting.count }.by(1)
    end
  end

  context 'notify_daysに「week」が設定されている場合' do
    before do
      Post.create(notify_days: :week, verify: false, user: user) 
    end
    subject(:task) { Rake.application['notification_setting:create_notification_setting_weekly'] }

    it 'create notification_setting' do
      expect { task.invoke }.to change { NotificationSetting.count }.by(1)
    end
  end

  context 'notify_daysに「month」が設定されている場合' do
    before do
      Post.create(notify_days: :month, verify: false, user: user) 
    end
    subject(:task) { Rake.application['notification_setting:create_notification_setting_monthly'] }

    it 'create notification_setting' do
      expect { task.invoke }.to change { NotificationSetting.count }.by(1)
    end
  end
end