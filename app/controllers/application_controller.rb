class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


  private

  def render_not_found(info)
    render json: { error: "#{info.model} not found" }, status: :not_found
  end

  def render_unprocessable_entity_response(info)
    render json: { errors: info.record.errors.full_messages }, status: :unprocessable_entity
  end
end
