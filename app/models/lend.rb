class Lend < ApplicationRecord
    belongs_to :staff
    belongs_to :asset

    validates :asset_id, presence: true, uniqueness: true
    validates :staff_id, :lended_at, presence: true
    validates :lend_status, inclusion: { in: [ "Available", "Lent", "Under Repair" ], allow_blank: false, message: "invalid lend status" }
end
