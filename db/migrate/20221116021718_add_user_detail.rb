class AddUserDetail < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :phone, :string, unique: true
    add_column :users, :otp, :string
    add_column :users, :otp_confirmed_at, :datetime
    add_column :users, :otp_attempt, :integer, default: 0
  end
end
