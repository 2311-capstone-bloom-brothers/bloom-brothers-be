class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response 

  def invalid_record_response(exception)
    render json: ErrorSerializer.serialize_json(ErrorMessage.new(exception.message)), status: 400
  end
end
