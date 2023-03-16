class Asset < ApplicationRecord
    validates :serial_number, presence: true, uniqueness: true
    validates :name, :description, :asset_type, :status, presence: true
    
end
