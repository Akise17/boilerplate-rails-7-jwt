class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  attr_reader :resource

  def create
    @resource = User.find_by(phone: sign_up_params[:phone])
    return register_success unless @resource.nil?

    @resource = User.new(sign_up_params)
    return register_success if @resource.save

    register_failed
  end

  private

  def register_success
    resource.send_otp
    render json: UserSerializer.new(resource)
  end

  def register_failed
    render json: { message: resource.errors.full_messages }
  end

  def sign_up_params
    user = params[:user]
    params[:user][:email] = "#{user[:phone]}@mail.com" unless user[:email].present?
    params.require(:user)
          .permit(:email,
                  :password,
                  :username,
                  :phone)
  end
end
