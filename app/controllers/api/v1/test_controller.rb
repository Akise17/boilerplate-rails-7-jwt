class Api::V1::TestController < Api::ApiController
  def index
    user = User.find(1000)
    render json: { message: 'hello world!', data: current_user }
  # rescue
  #   render jsonapi_errors: user.errors, status: :not_found
  end
end
