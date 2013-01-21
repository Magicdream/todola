class Api::BaseController < ApplicationController
  # TODO: add not found exception handler
  rescue_from Exception, with: :error_render_method

  skip_before_filter :verify_authenticity_token
  respond_to :json

  protected

  def ok_response(response = {})
    response[:status] = 'OK'
    render status: 200, json: response
  end

  def error_response(error_code, response = {})
    response[:status] = error_code
    render status: 401, json: response
  end

  def authenticate_user!
    if params[:auth_token].blank? || !User.exists?(authentication_token: params[:auth_token])
      error_response("UNAUTHORIZED")
    end
  end

  def error_render_method(exception)
    Rails.logger.error(exception.backtrace.join("\n"))
    error_response('INTERNAL_ERROR')
  end
end