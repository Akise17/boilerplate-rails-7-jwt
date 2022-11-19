class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  attr_reader :user

  def create
    @user = User.find_by_phone(params[:phone])
    return login_failed if @user.nil?

    verification = @user.otp_verify(params[:otp])
    return login_success if verification

    login_failed
  end

  def new
    return login_failed if current_user.nil?
  end

  private

  def login_success
    sign_in(:user, user)
    render json: UserSerializer.new(user)
  end

  def login_failed
    render json: { message: 'Unauthorized' }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logged out failure.' }, status: :unauthorized
  end
end
