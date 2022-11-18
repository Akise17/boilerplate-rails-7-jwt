class WhatsappCredential < ApplicationRecord
  def self.get_token
    credential = all.order('RANDOM()').first
    credential.token
  end
end
