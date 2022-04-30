# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  before_action :configure_permit_parameters
  before_action :user_state,only: [:create]

  def after_sign_in_path_for(resource)
    new_post_path
  end

  protected
  def configure_permit_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name])
  end

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user
    if @user.valid.password?(params[:user][:password]) && @user.is_daleted
      redirect_to new_user_registration_path
    end
  end
end
