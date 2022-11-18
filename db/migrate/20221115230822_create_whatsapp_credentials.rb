class CreateWhatsappCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :whatsapp_credentials do |t|
      t.string :number
      t.string :token
      t.boolean :is_enabled, default: true
    end
  end
end
