class Users::SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user!, only: [:new]
# before_filter :configure_sign_in_params, only: [:create]

  # # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #   redirect_to experiences_path
  # end

  # # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :username
  # end
end
