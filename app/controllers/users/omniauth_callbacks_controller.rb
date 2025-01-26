# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter2
    callback_for(:twitter2)
  end

  def google_oauth2
    callback_for(:google_oauth2)
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    @user.save!
    # persisted?でDBに保存済みかどうか判断
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_path
    end
  end
end
