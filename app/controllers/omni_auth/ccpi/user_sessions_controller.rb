class OmniAuth::Ccpi::UserSessionsController < ApplicationController

  # POST /auth/:provider/callback
  def create

    # Get the OmniAuth authentication callback data.
    omniauth = env['omniauth.auth']

    # Get the UID for the logged-in User.
    uid = omniauth['uid']
    Rails.logger.info "*"*80
    Rails.logger.info "* user_id: #{uid}"
    Rails.logger.info omniauth

    # Try to find the User in the local database.
    user = User.find_by(uid: uid)

    # Create the User in the local database if this is the first time this
    # User is signing in to this application.
    user = User.new(uid: uid) unless user
    Rails.logger.info "* The token is: *****************************************"
    Rails.logger.info omniauth['credentials']['token']
    user.access_token = omniauth['credentials']['token']

    # Get the info attributes for the User returned from the callback.
    user_info = omniauth['info']

    # Get the additional attributes for the User returned from the callback.
    user_attributes = omniauth['extra']

    # Update the attributes for the User in the local database.
    user.email           = user_info['email']
    user.name            = user_info['name']
    user.access_level    = user_attributes['access_level'].to_sym
    user.save

    # Display a message indicating a successful login and redirect to this
    # application's root URL.

    # Store the OmniAuth authentication callback data in session.
    Rails.logger.info omniauth
    Rails.logger.info "#{omniauth['uid']}"
    session[:user_id] = omniauth['uid']

    flash[:notice] = "You have logged in successfully"
    redirect_to root_url
  end

  # POST /auth/failure
  def failure
    # Display a message indicating a failure occurred during login.
    flash[:error] = params[:message]
  end

  # GET /logout
  def destroy
    # Clear all session data.
    reset_session
    # Check if a redirect URL was provided.
    redirect_url_param = params[:redirect_url] ? "?redirect_url=#{params[:redirect_url]}" : ""

    Rails.logger.info "*******************************************************************"
    Rails.logger.info OmniAuth::ccpi.provider_url
    Rails.logger.info "*******************************************************************"

    # Display a message indicating a successful logout and redirect to the
    # authentication provider to logout globally.
    flash[:notice] = "You have logged out successfully"
    redirect_to "#{OmniAuth::ccpi.provider_url}/logout#{redirect_url_param}"
  end
end
