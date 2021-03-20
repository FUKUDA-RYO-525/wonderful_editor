class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  #   skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session

  private

    def sign_up_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:name, :email)
    end
end
