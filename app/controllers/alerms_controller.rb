class AlermsController < ApplicationController
  before_action :authenticate_user!
  def index
    @alerms = current_user.alerms.order(created_at: :desc).distinct.page(params[:page]).per(20)
    @alerms.where(notice: false).each do |alerm|
      alerm.update(notice: true)
    end
  end
end