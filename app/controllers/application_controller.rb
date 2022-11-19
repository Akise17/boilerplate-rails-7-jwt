class ApplicationController < ActionController::Base
  around_action :handle_errors

  def handle_errors
    yield
  rescue ActiveRecord::RecordNotFound => e
    render_api_error(e.message, 404)
  rescue ActiveRecord::RecordInvalid => e
    render_api_error(e.record.errors.full_messages, 422)
  rescue JWT::ExpiredSignature => e
    render_api_error(e.message, 401)
  rescue InvalidTokenError => e
    render_api_error(e.message, 422)
  rescue MissingTokenError => e
    render_api_error(e.message, 422)
  end

  def render_api_error(messages, code)
    data = { errors: { code: code, details: Array.wrap(messages) } }
    render json: data, status: code
  end
end
