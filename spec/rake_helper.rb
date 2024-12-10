require 'rails_helper'
require 'rake'

RSpec.configure do |config|
  #全てのrakeタスクを読み込む
  config.before(:suite) do
    Rails.application.load_tasks
  end
  # Reset all Rake tasks so that the same task can be run multiple times
  config.before(:each) do
    Rake.application.tasks.each(&:reenable)
  end
end