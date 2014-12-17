class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      @user.confirmation_token = nil
      @user.confirmed_at = Time.now
      @user.save
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_path
    end
  end
end
