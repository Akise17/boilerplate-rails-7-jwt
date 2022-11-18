module Notification::WhatsappHelper
  class SendMessage
    include HTTParty
    require 'uri'
    require 'net/http'

    base_uri ENV['WHATSAPP_API_URL']

    def self.run(number:, message: 'test')
      data = { token: WhatsappCredential.get_token,
               number:,
               message: }

      create(data)
    end

    def self.create(body)
      post('/sendmessage',
           headers: { 'Content-Type': 'application/json' },
           body: body.to_json)
    end
  end
end
