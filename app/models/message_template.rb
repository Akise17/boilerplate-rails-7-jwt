class MessageTemplate < ApplicationRecord
  def self.get(name, fallback_env: true)
    find_by_name(name).template || (fallback_env ? ENV[name] : nil)
  end

  def self.[](name)
    get(name, fallback_env: true)
  end
end
