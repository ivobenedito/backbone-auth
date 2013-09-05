module Api
  class SessionsController < Api::BaseController
    before_filter :authenticate_user!, only: :destroy

    def show
      render json: { 
        id: session[:session_id], 
        user: current_user
      }, status: :ok
    end

    def create
      @user = User.find_for_database_authentication(login: params[:login])
      return invalid_login_attempt unless @user.present?

      if @user.valid_password?(params[:password])
        @user.ensure_authentication_token!
        sign_in(:user, @user)
        render json: { 
          success: true, 
          id: session[:session_id],
          user: @user
        }, status: :created
       return
     end
     invalid_login_attempt
    end

    def destroy
      current_user.reset_authentication_token!
      sign_out(current_user)
      render json: { success: true }, status: :ok
    end

    protected

    def invalid_login_attempt
      warden.custom_failure!
      render json: { 
        success: false, 
        message: "Error with your login or password" 
      }, status: :unauthorized
    end    
  end
end