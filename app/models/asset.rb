class Asset < ApplicationRecord
    has_one :lend
    
    validates :serial_number, presence: true, uniqueness: true
    validates :name, :description, :asset_type, presence: true
    validates :status, inclusion: { in: [ "Available", "Lent", "Under Repair" ], allow_blank: false, message: "invalid asset status" }
end
