class TopController < ApplicationController
  before_action :authenticate_user!, except: [:policy]
  def index; end

  def policy; end
end
