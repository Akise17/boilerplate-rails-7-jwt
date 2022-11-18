# frozen_string_literal: true

class AddWhatsappCredentialsData < ActiveRecord::Migration[7.0]
  def up
    WhatsappCredential.create(number: '6285163635482',
                              token: '5f875f03-e8e6-4dce-b1e6-b327c53ba425')
    WhatsappCredential.create(number: '6285173320970',
                              token: 'f2022cff-e95e-48ef-b910-182e5b5cc9d0')
  end

  def down() end
end
