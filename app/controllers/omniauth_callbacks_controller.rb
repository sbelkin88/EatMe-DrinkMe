class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # skip_before_filter :verify_authenticity_token, only: :all
  def all
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.persisted?
      sign_in_and_redirect(user)
    else
      redirect_to new_user_registration_path
    end
  end

  alias_method :facebook, :all
  alias_method :google_oauth2, :all

end
