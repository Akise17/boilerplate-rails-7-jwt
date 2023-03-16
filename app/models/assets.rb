class Assets < ApplicationRecord
  belongs_to :staff, foreign_key: 'staff_id', optional: true
  validates :name, :serial_number, :types, presence: true
  enum status: { available: 0, lent: 1, under_repair: 2 }
end
