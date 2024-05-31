class Api::V0::SignInController < ApplicationController
  def sign_in
    login = User.find_by(email: sign_in_params[:email])
    
    if login.authenticate(sign_in_params[:password])
      render json: {data: {id: login.id}}
    else
      render json: {error: "Invalid Parameters for Sign In"}, status: 422
    end
  end

  private 

  def sign_in_params
    params.permit(:email, :password)
  end
end