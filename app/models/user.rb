class User < ApplicationRecord
  include Notification::WhatsappHelper

  validates :phone, presence: true

  has_one_time_password column_name: :otp,
                        length: 6,
                        interval: 60,
                        counter_based: true,
                        counter_column_name: :otp_attempt

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable, :recoverable, :rememberable, :validatable,
         jwt_revocation_strategy: JwtDenylist

  def send_otp
    message = MessageTemplate['auth_otp'].sub('#otp_number', otp_code)
    SendMessage.run(number: phone, message:)
  end

  def otp_verify(otp)
    verification = authenticate_otp(otp, auto_increment: true)
    if verification
      self.otp_confirmed_at = DateTime.now
      save
    end
    verification
  end
end
