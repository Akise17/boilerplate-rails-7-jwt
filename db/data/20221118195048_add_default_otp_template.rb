# frozen_string_literal: true

class AddDefaultOtpTemplate < ActiveRecord::Migration[7.0]
  def up
    message = 'Hello guys ini otpnya #*#otp_number* Jangan kasih siapa-siapa ya'
    MessageTemplate.create(name: 'auth_otp',
                           template: message)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
