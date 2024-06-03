class Api::V0::SignOutController < ApplicationController
  def sign_out
    if params[:user_id]
      render status:204
    else 
      render status: 404
    end
  end 
end