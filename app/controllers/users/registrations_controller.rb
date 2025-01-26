# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = build_resource(sign_up_params)
    @user.skip_confirmation!
    @user.save
    yield @user if block_given?
    if @user.persisted?
      if @user.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, @user)
        respond_with @user, location: after_sign_up_path_for(@user)
      else
        set_flash_message! :notice, :"signed_up_but_#{@user.inactive_message}"
        expire_data_after_sign_in!
        respond_with @user, location: after_inactive_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      set_minimum_password_length
      respond_with @user
    end
  end
end
