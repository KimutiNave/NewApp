class TopController < ApplicationController
  skip_before_action :authenticate_user!, only: [:policy]
  def index; end

  def policy; end
end
